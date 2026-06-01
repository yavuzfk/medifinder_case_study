import 'package:get_it/get_it.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_local_datasource.dart';

/// SADECE debug demo amaçlı. Release'de çağrılmaz (kDebugMode gate'i UI'da).
/// Presentation'ın data impl'ini import etmesini önlemek için burada durur.
bool toggleMockFailure(GetIt gh) {
  final ds = gh<ProviderLocalDataSource>();
  if (ds is ProviderLocalDataSourceImpl) {
    return ds.shouldFail = !ds.shouldFail;
  }
  return false;
}
