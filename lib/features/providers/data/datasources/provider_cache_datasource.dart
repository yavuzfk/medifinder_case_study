import 'dart:convert';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:medifinder_case_study/features/providers/data/models/provider_model.dart';

/// Sağlayıcı kataloğunu cihazda saklayan offline cache.
/// Remote başarılı olduğunda tam katalog buraya yazılır; remote hata verince
/// repository buradan okuyup client-side filtreler.
abstract interface class ProviderCacheDataSource {
  Future<void> saveCatalog(List<ProviderModel> providers);

  /// Cache yoksa veya çözümlenemezse boş liste döner (asla fırlatmaz).
  List<ProviderModel> readCatalog();
}

class HiveProviderCacheDataSource implements ProviderCacheDataSource {
  HiveProviderCacheDataSource(this._box);

  final Box<dynamic> _box;

  static const _key = 'catalog';

  @override
  Future<void> saveCatalog(List<ProviderModel> providers) {
    final encoded = jsonEncode(providers.map((p) => p.toJson()).toList());
    return _box.put(_key, encoded);
  }

  @override
  List<ProviderModel> readCatalog() {
    final raw = _box.get(_key);
    if (raw is! String) return const [];
    try {
      final decoded = jsonDecode(raw) as List<dynamic>;
      return decoded
          .map((e) => ProviderModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on Object {
      return const [];
    }
  }
}
