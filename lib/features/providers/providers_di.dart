import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_cache_datasource.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_remote_datasource.dart';
import 'package:medifinder_case_study/features/providers/data/repositories/provider_repository_impl.dart';
import 'package:medifinder_case_study/features/providers/domain/repositories/provider_repository.dart';
import 'package:medifinder_case_study/features/providers/domain/usecases/get_filter_options.dart';
import 'package:medifinder_case_study/features/providers/domain/usecases/get_provider_detail.dart';
import 'package:medifinder_case_study/features/providers/domain/usecases/get_providers.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/filter_bloc.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_detail_bloc.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_list_bloc.dart';

void registerProvidersFeature(GetIt gh) {
  gh
    ..registerLazySingleton<ProviderRemoteDataSource>(
      ProviderRemoteDataSourceImpl.new,
    )
    ..registerLazySingleton<ProviderCacheDataSource>(
      () => HiveProviderCacheDataSource(Hive.box<dynamic>('provider_cache')),
    )
    ..registerLazySingleton<ProviderRepository>(
      () => ProviderRepositoryImpl(gh(), gh()),
    )
    ..registerFactory(() => GetProviders(gh()))
    ..registerFactory(() => GetProviderDetail(gh()))
    ..registerFactory(() => GetFilterOptions(gh()))
    ..registerFactory(() => ProviderListBloc(getProviders: gh()))
    ..registerFactory(() => FilterBloc(getFilterOptions: gh()))
    ..registerFactory(() => ProviderDetailBloc(getProviderDetail: gh()));
}
