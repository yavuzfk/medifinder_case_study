import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/domain/repositories/provider_repository.dart';

class GetProviderDetail {
  const GetProviderDetail(this._repository);
  final ProviderRepository _repository;

  Future<Result<Provider>> call(String id) =>
      _repository.getProviderById(id);
}
