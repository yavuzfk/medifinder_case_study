import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:medifinder_case_study/features/providers/data/datasources/provider_cache_datasource.dart';
import 'package:medifinder_case_study/features/providers/data/models/provider_model.dart';
import 'package:mocktail/mocktail.dart';

class _MockBox extends Mock implements Box<dynamic> {}

void main() {
  late _MockBox box;
  late HiveProviderCacheDataSource cache;

  setUp(() {
    box = _MockBox();
    cache = HiveProviderCacheDataSource(box);
  });

  const model = ProviderModel(
    id: '1',
    name: 'Dr. Emily Carter',
    type: 'doctor',
    category: 'Cardiology',
    country: 'United States',
    city: 'New York',
  );

  test('saveCatalog writes the JSON-encoded list under the catalog key', () async {
    when(() => box.put(any<dynamic>(), any<dynamic>())).thenAnswer((_) async {});

    await cache.saveCatalog([model]);

    final expected = jsonEncode([model.toJson()]);
    verify(() => box.put('catalog', expected)).called(1);
  });

  test('readCatalog parses stored JSON back into models', () {
    when(() => box.get('catalog'))
        .thenReturn(jsonEncode([model.toJson()]));

    final result = cache.readCatalog();

    expect(result.single.id, '1');
    expect(result.single.name, 'Dr. Emily Carter');
  });

  test('readCatalog returns empty when nothing is cached', () {
    when(() => box.get('catalog')).thenReturn(null);
    expect(cache.readCatalog(), isEmpty);
  });

  test('readCatalog returns empty on malformed data', () {
    when(() => box.get('catalog')).thenReturn('not json');
    expect(cache.readCatalog(), isEmpty);
  });
}
