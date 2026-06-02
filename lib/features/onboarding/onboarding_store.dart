import 'package:hive_ce_flutter/hive_ce_flutter.dart';

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
