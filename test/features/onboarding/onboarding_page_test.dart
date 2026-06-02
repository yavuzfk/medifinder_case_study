import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/features/onboarding/domain/entities/onboarding_slide.dart';
import 'package:medifinder_case_study/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:medifinder_case_study/features/onboarding/domain/usecases/complete_onboarding.dart';
import 'package:medifinder_case_study/features/onboarding/domain/usecases/get_onboarding_slides.dart';
import 'package:medifinder_case_study/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:medifinder_case_study/features/onboarding/presentation/pages/onboarding_page.dart';

class _FakeOnboardingRepository implements OnboardingRepository {
  bool completed = false;

  @override
  bool get isCompleted => completed;

  @override
  Future<void> complete() async => completed = true;

  @override
  List<OnboardingSlide> getSlides() => const [
        OnboardingSlide(asset: 'a.svg', title: 'Doğru bakımı bulun', subtitle: ''),
        OnboardingSlide(asset: 'b.svg', title: 'Güvenle filtreleyin', subtitle: ''),
        OnboardingSlide(asset: 'c.svg', title: 'Net karar verin', subtitle: ''),
      ];
}

void main() {
  late _FakeOnboardingRepository repository;

  setUp(() {
    repository = _FakeOnboardingRepository();
    getIt.registerFactory(
      () => OnboardingBloc(
        getSlides: GetOnboardingSlides(repository),
        completeOnboarding: CompleteOnboarding(repository),
      ),
    );
  });

  tearDown(getIt.reset);

  Widget harness() {
    final router = GoRouter(
      initialLocation: '/onboarding',
      routes: [
        GoRoute(
          path: '/onboarding',
          builder: (_, _) => const OnboardingPage(),
        ),
        GoRoute(
          path: '/',
          builder: (_, _) => const Scaffold(body: Text('LIST')),
        ),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }

  testWidgets('advances through slides then completes via Get Started', (
    tester,
  ) async {
    await tester.pumpWidget(harness());
    await tester.pumpAndSettle();

    expect(find.text('Doğru bakımı bulun'), findsOneWidget);

    await tester.tap(find.text('İleri'));
    await tester.pumpAndSettle();
    expect(find.text('Güvenle filtreleyin'), findsOneWidget);

    await tester.tap(find.text('İleri'));
    await tester.pumpAndSettle();
    expect(find.text('Net karar verin'), findsOneWidget);
    expect(find.text('Başla'), findsOneWidget);

    await tester.tap(find.text('Başla'));
    await tester.pumpAndSettle();

    expect(repository.completed, isTrue);
    expect(find.text('LIST'), findsOneWidget);
  });

  testWidgets('Skip completes onboarding and navigates to the list', (
    tester,
  ) async {
    await tester.pumpWidget(harness());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Atla'));
    await tester.pumpAndSettle();

    expect(repository.completed, isTrue);
    expect(find.text('LIST'), findsOneWidget);
  });
}
