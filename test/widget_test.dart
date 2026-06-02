import 'package:flutter_test/flutter_test.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/features/onboarding/domain/entities/onboarding_slide.dart';
import 'package:medifinder_case_study/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_cache_datasource.dart';
import 'package:medifinder_case_study/features/providers/data/models/provider_model.dart';
import 'package:medifinder_case_study/features/providers/presentation/widgets/provider_card.dart';
import 'package:medifinder_case_study/main.dart';
import 'package:skeletonizer/skeletonizer.dart';

class _CompletedOnboardingRepository implements OnboardingRepository {
  @override
  bool get isCompleted => true;
  @override
  Future<void> complete() async {}
  @override
  List<OnboardingSlide> getSlides() => const [];
}

class _FakeCache implements ProviderCacheDataSource {
  final List<ProviderModel> _catalog = [];

  @override
  Future<void> saveCatalog(List<ProviderModel> providers) async {
    _catalog
      ..clear()
      ..addAll(providers);
  }

  @override
  List<ProviderModel> readCatalog() => _catalog;
}

void main() {
  setUp(() async {
    await getIt.reset();
    await configureDependencies();
    getIt
      ..unregister<OnboardingRepository>()
      ..registerSingleton<OnboardingRepository>(_CompletedOnboardingRepository())
      ..unregister<ProviderCacheDataSource>()
      ..registerSingleton<ProviderCacheDataSource>(_FakeCache());
  });

  tearDown(getIt.reset);

  final skeleton = find.byWidgetPredicate((w) => w is Skeletonizer);

  testWidgets('list screen shows skeleton, then provider cards', (tester) async {
    await tester.pumpWidget(const MediFinderApp());

    await tester.pump();
    expect(find.text('Sağlık hizmeti bul'), findsOneWidget);
    expect(skeleton, findsOneWidget);

    await tester.pump(const Duration(milliseconds: 800));
    expect(skeleton, findsNothing);
    expect(find.byType(ProviderCard), findsWidgets);
  });
}
