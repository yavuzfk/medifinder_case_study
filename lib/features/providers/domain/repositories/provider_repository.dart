import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/filter_options.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';

abstract interface class ProviderRepository {
  Future<Result<List<Provider>>> getProviders(ProviderFilter filter);
  Future<Result<Provider>> getProviderById(String id);
  Future<Result<FilterOptions>> getFilterOptions();
}
