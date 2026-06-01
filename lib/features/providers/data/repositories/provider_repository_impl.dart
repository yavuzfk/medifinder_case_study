import 'package:medifinder_case_study/core/error/exceptions.dart';
import 'package:medifinder_case_study/core/error/failure.dart';
import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_local_datasource.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/filter_options.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/domain/repositories/provider_repository.dart';

class ProviderRepositoryImpl implements ProviderRepository {
  ProviderRepositoryImpl(this._local);
  final ProviderLocalDataSource _local;

  @override
  Future<Result<List<Provider>>> getProviders(ProviderFilter filter) async {
    try {
      final models = await _local.getProviders(filter);
      return Success(models.map((m) => m.toEntity()).toList());
    } on ServerException catch (e) {
      return ResultFailure(Failure.server(message: e.message));
    } on Object catch (e) {
      return ResultFailure(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<Provider>> getProviderById(String id) async {
    try {
      final model = await _local.getProviderById(id);
      return Success(model.toEntity());
    } on NotFoundException catch (e) {
      return ResultFailure(Failure.notFound(message: e.message));
    } on ServerException catch (e) {
      return ResultFailure(Failure.server(message: e.message));
    } on Object catch (e) {
      return ResultFailure(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Result<FilterOptions>> getFilterOptions() async {
    try {
      final all = await _local.getProviders(const ProviderFilter());
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
      return Success(
        FilterOptions(
          countries: countries,
          citiesByCountry: citiesByCountry,
          categories: categories,
        ),
      );
    } on Object catch (e) {
      return ResultFailure(Failure.unknown(message: e.toString()));
    }
  }
}
