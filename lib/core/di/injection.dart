import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

/// main() içinde bir kez çağrılır.
Future<void> configureDependencies() async {
  _registerCore();
  // Feature kayıtları sonraki branch'lerde eklenir:
  // registerProvidersFeature(getIt);
}

void _registerCore() {
  // Ortak bağımlılıklar (ör. Hive box'ları, router) burada kaydedilebilir.
}
