import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/filter_options.dart';
import 'package:medifinder_case_study/features/providers/domain/repositories/provider_repository.dart';

class GetFilterOptions {
  const GetFilterOptions(this._repository);
  final ProviderRepository _repository;

  Future<Result<FilterOptions>> call() => _repository.getFilterOptions();
}
