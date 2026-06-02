import 'package:medifinder_case_study/core/error/exceptions.dart';
import 'package:medifinder_case_study/core/error/failure.dart';
import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_cache_datasource.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_remote_datasource.dart';
import 'package:medifinder_case_study/features/providers/data/models/provider_model.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/filter_options.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/domain/repositories/provider_repository.dart';

class ProviderRepositoryImpl implements ProviderRepository {
  ProviderRepositoryImpl(this._remote, this._cache);

  final ProviderRemoteDataSource _remote;
  final ProviderCacheDataSource _cache;

  @override
  Future<Result<Cached<List<Provider>>>> getProviders(
    ProviderFilter filter,
  ) async {
    try {
      final models = await _remote.getProviders(filter);
      // Filtresiz çağrı = tam katalog → offline için sakla.
      if (filter == const ProviderFilter()) {
        await _cache.saveCatalog(models);
      }
      return Success((value: _toEntities(models), fromCache: false));
    } on Object catch (e) {
      final cached = _cache.readCatalog();
      if (cached.isEmpty) {
        return ResultFailure(_failureFor(e));
      }
      final filtered =
          cached.where((m) => providerMatchesFilter(m, filter)).toList();
      return Success((value: _toEntities(filtered), fromCache: true));
    }
  }

  @override
  Future<Result<Cached<Provider>>> getProviderById(String id) async {
    try {
      final model = await _remote.getProviderById(id);
      return Success((value: model.toEntity(), fromCache: false));
    } on NotFoundException catch (e) {
      // Gerçekten yok → cache'e düşme.
      return ResultFailure(Failure.notFound(message: e.message));
    } on Object catch (e) {
      final cached =
          _cache.readCatalog().where((m) => m.id == id).firstOrNull;
      if (cached != null) {
        return Success((value: cached.toEntity(), fromCache: true));
      }
      return ResultFailure(_failureFor(e));
    }
  }

  @override
  Future<Result<FilterOptions>> getFilterOptions() async {
    try {
      final all = await _remote.getProviders(const ProviderFilter());
      await _cache.saveCatalog(all);
      return Success(_optionsFrom(all));
    } on Object catch (e) {
      final cached = _cache.readCatalog();
      if (cached.isNotEmpty) {
        return Success(_optionsFrom(cached));
      }
      return ResultFailure(_failureFor(e));
    }
  }

  List<Provider> _toEntities(List<ProviderModel> models) =>
      models.map((m) => m.toEntity()).toList();

  Failure _failureFor(Object e) => switch (e) {
        ServerException(:final message) => Failure.server(message: message),
        CacheException(:final message) => Failure.cache(message: message),
        _ => Failure.unknown(message: e.toString()),
      };

  FilterOptions _optionsFrom(List<ProviderModel> all) {
    final countries = {...all.map((p) => p.country)}.toList()..sort();
    final citiesByCountry = <String, List<String>>{};
    for (final p in all) {
      final cities = citiesByCountry.putIfAbsent(p.country, () => []);
      if (!cities.contains(p.city)) {
        cities.add(p.city);
      }
    }
    for (final cities in citiesByCountry.values) {
      cities.sort();
    }
    final categories = {...all.map((p) => p.category)}.toList()..sort();
    return FilterOptions(
      countries: countries,
      citiesByCountry: citiesByCountry,
      categories: categories,
    );
  }
}
