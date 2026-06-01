import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/domain/repositories/provider_repository.dart';

class GetProviders {
  const GetProviders(this._repository);
  final ProviderRepository _repository;

  Future<Result<List<Provider>>> call(ProviderFilter filter) =>
      _repository.getProviders(filter);
}
