import 'package:get_it/get_it.dart';
import 'package:medifinder_case_study/features/providers/providers_di.dart';

final GetIt getIt = GetIt.instance;

/// main() içinde bir kez çağrılır.
Future<void> configureDependencies() async {
  _registerCore();
  registerProvidersFeature(getIt);
}

void _registerCore() {
  // Ortak bağımlılıklar (ör. Hive box'ları, router) burada kaydedilebilir.
}
