import 'package:hive_ce_flutter/hive_ce_flutter.dart';

/// Onboarding'in bir kez gösterilmesini sağlayan kalıcı bayrak.
/// Router redirect'i ve sayfa, Hive'a doğrudan bağlanmasın diye soyutlandı
/// (test edilebilirlik: testlerde sahte bir uygulama enjekte edilir).
abstract interface class OnboardingStore {
  bool get isOnboarded;
  Future<void> complete();
}

class HiveOnboardingStore implements OnboardingStore {
  HiveOnboardingStore(this._box);

  final Box<dynamic> _box;

  static const _key = 'onboarded';

  @override
  bool get isOnboarded => _box.get(_key, defaultValue: false) as bool;

  @override
  Future<void> complete() => _box.put(_key, true);
}
