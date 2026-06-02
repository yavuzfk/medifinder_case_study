import 'package:get_it/get_it.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_remote_datasource.dart';

bool toggleMockFailure(GetIt gh) {
  final ds = gh<ProviderRemoteDataSource>();
  if (ds is ProviderRemoteDataSourceImpl) {
    return ds.shouldFail = !ds.shouldFail;
  }
  return false;
}
