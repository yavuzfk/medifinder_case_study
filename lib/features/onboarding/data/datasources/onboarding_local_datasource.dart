import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:medifinder_case_study/features/onboarding/domain/entities/onboarding_slide.dart';

abstract interface class OnboardingLocalDataSource {
  List<OnboardingSlide> getSlides();
  bool get isCompleted;
  Future<void> markCompleted();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  OnboardingLocalDataSourceImpl(this._box);

  final Box<dynamic> _box;

  static const _completedKey = 'onboarded';

  @override
  List<OnboardingSlide> getSlides() => _slides;

  @override
  bool get isCompleted => _box.get(_completedKey, defaultValue: false) as bool;

  @override
  Future<void> markCompleted() => _box.put(_completedKey, true);
}

const _slides = <OnboardingSlide>[
  OnboardingSlide(
    asset: 'assets/illustrations/discover.svg',
    title: 'Doğru bakımı bulun',
    subtitle:
        'Dünya genelinde güvenilir doktorları, klinikleri ve hastaneleri arayın.',
  ),
  OnboardingSlide(
    asset: 'assets/illustrations/filter.svg',
    title: 'Güvenle filtreleyin',
    subtitle:
        'Doğru uzmana hızla ulaşmak için ülke, şehir ve branşa göre daraltın.',
  ),
  OnboardingSlide(
    asset: 'assets/illustrations/decide.svg',
    title: 'Net karar verin',
    subtitle: 'Branşları, puanları ve iletişim bilgilerini tek bakışta görün.',
  ),
];
