import 'package:get_it/get_it.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_local_datasource.dart';
import 'package:medifinder_case_study/features/providers/data/repositories/provider_repository_impl.dart';
import 'package:medifinder_case_study/features/providers/domain/repositories/provider_repository.dart';
import 'package:medifinder_case_study/features/providers/domain/usecases/get_filter_options.dart';
import 'package:medifinder_case_study/features/providers/domain/usecases/get_provider_detail.dart';
import 'package:medifinder_case_study/features/providers/domain/usecases/get_providers.dart';

void registerProvidersFeature(GetIt gh) {
  gh
    ..registerLazySingleton<ProviderLocalDataSource>(
      ProviderLocalDataSourceImpl.new,
    )
    ..registerLazySingleton<ProviderRepository>(
      () => ProviderRepositoryImpl(gh()),
    )
    ..registerFactory(() => GetProviders(gh()))
    ..registerFactory(() => GetProviderDetail(gh()))
    ..registerFactory(() => GetFilterOptions(gh()));
}
