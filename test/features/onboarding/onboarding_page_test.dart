import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/features/onboarding/onboarding_page.dart';
import 'package:medifinder_case_study/features/onboarding/onboarding_store.dart';

class _StubOnboardingStore implements OnboardingStore {
  _StubOnboardingStore({required this.isOnboarded});

  @override
  bool isOnboarded;

  @override
  Future<void> complete() async => isOnboarded = true;
}

void main() {
  late _StubOnboardingStore store;

  setUp(() {
    store = _StubOnboardingStore(isOnboarded: false);
    getIt.registerSingleton<OnboardingStore>(store);
  });

  tearDown(getIt.reset);

  // OnboardingPage context.go ile listeye gider → minimal yerel router.
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

    expect(store.isOnboarded, isTrue);
    expect(find.text('LIST'), findsOneWidget);
  });

  testWidgets('Skip completes onboarding and navigates to the list', (
    tester,
  ) async {
    await tester.pumpWidget(harness());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Atla'));
    await tester.pumpAndSettle();

    expect(store.isOnboarded, isTrue);
    expect(find.text('LIST'), findsOneWidget);
  });
}
