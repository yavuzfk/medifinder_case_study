import 'package:flutter_test/flutter_test.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/features/onboarding/onboarding_store.dart';
import 'package:medifinder_case_study/features/providers/presentation/widgets/provider_card.dart';
import 'package:medifinder_case_study/main.dart';
import 'package:skeletonizer/skeletonizer.dart';

class _StubOnboardingStore implements OnboardingStore {
  @override
  bool get isOnboarded => true;
  @override
  Future<void> complete() async {}
}

void main() {
  setUp(() async {
    await getIt.reset();
    await configureDependencies();
    // Onboarding'i Hive'sız atla: redirect doğrudan listeye düşsün.
    getIt
      ..unregister<OnboardingStore>()
      ..registerSingleton<OnboardingStore>(_StubOnboardingStore());
  });

  tearDown(getIt.reset);

  // Skeletonizer soyut bir sınıf (constructor somut alt tip döndürür),
  // bu yüzden byType yerine predicate ile eşleştiriyoruz.
  final skeleton = find.byWidgetPredicate((w) => w is Skeletonizer);

  testWidgets('list screen shows skeleton, then provider cards', (tester) async {
    await tester.pumpWidget(const MediFinderApp());

    // İlk frame: header başlığı + iskelet loading (mock 700ms gecikme).
    await tester.pump();
    expect(find.text('Find a provider'), findsOneWidget);
    expect(skeleton, findsOneWidget);

    // Mock latency sonrası loaded → iskelet kalkar, gerçek kartlar gelir.
    await tester.pump(const Duration(milliseconds: 800));
    expect(skeleton, findsNothing);
    expect(find.byType(ProviderCard), findsWidgets);
  });
}
