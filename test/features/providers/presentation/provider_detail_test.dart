import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medifinder_case_study/core/error/failure.dart';
import 'package:medifinder_case_study/core/utils/result.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_type.dart';
import 'package:medifinder_case_study/features/providers/domain/usecases/get_provider_detail.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_detail_bloc.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_detail_event.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/provider_detail_state.dart';
import 'package:medifinder_case_study/features/providers/presentation/pages/provider_detail_page.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetProviderDetail extends Mock implements GetProviderDetail {}

void main() {
  const full = Provider(
    id: '1',
    name: 'Dr. Emily Carter',
    type: ProviderType.doctor,
    category: 'Cardiology',
    country: 'United States',
    city: 'New York',
    rating: 4.8,
    phone: '+1 212 555 0101',
    bio: 'Experienced cardiologist.',
  );

  const sparse = Provider(
    id: '2',
    name: 'Manhattan Heart Clinic',
    type: ProviderType.clinic,
    category: 'Cardiology',
    country: 'United States',
    city: 'New York',
  );

  group('ProviderDetailBloc', () {
    late _MockGetProviderDetail getProviderDetail;

    setUp(() => getProviderDetail = _MockGetProviderDetail());

    ProviderDetailBloc build() =>
        ProviderDetailBloc(getProviderDetail: getProviderDetail);

    blocTest<ProviderDetailBloc, ProviderDetailState>(
      'emits [loading, loaded] on success',
      setUp: () => when(() => getProviderDetail(any())).thenAnswer(
        (_) async => const Success((value: full, fromCache: false)),
      ),
      build: build,
      act: (bloc) => bloc.add(const ProviderDetailEvent.started('1')),
      expect: () => [
        const ProviderDetailState.loading(),
        const ProviderDetailState.loaded(full),
      ],
    );

    blocTest<ProviderDetailBloc, ProviderDetailState>(
      'maps NotFoundFailure to a not-found message',
      setUp: () => when(() => getProviderDetail(any()))
          .thenAnswer((_) async => const ResultFailure(Failure.notFound())),
      build: build,
      act: (bloc) => bloc.add(const ProviderDetailEvent.started('x')),
      expect: () => [
        const ProviderDetailState.loading(),
        const ProviderDetailState.error('Kayıt bulunamadı.'),
      ],
    );
  });

  group('ProviderDetailContent null-handling', () {
    Future<void> pump(WidgetTester tester, Provider provider) {
      return tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ProviderDetailContent(provider: provider)),
        ),
      );
    }

    testWidgets('hides missing contact/bio and shows fallback', (tester) async {
      await pump(tester, sparse);

      expect(find.text('Manhattan Heart Clinic'), findsOneWidget);
      expect(find.text('İletişim bilgisi bulunmuyor.'), findsOneWidget);
      expect(find.byIcon(Icons.phone_outlined), findsNothing);
      expect(find.text('HAKKINDA'), findsNothing);
      expect(find.byIcon(Icons.star), findsNothing);
    });

    testWidgets('renders present fields', (tester) async {
      await pump(tester, full);

      expect(find.text('+1 212 555 0101'), findsOneWidget);
      expect(find.text('HAKKINDA'), findsOneWidget);
      expect(find.text('Experienced cardiologist.'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
    });
  });
}
