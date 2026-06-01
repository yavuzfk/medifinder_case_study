import 'package:flutter_test/flutter_test.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/core/widgets/loading_view.dart';
import 'package:medifinder_case_study/features/providers/presentation/widgets/provider_card.dart';
import 'package:medifinder_case_study/main.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    await configureDependencies();
  });

  tearDown(getIt.reset);

  testWidgets('list screen shows loading, then provider cards', (tester) async {
    await tester.pumpWidget(const MediFinderApp());

    // İlk frame: appbar başlığı + loading (mock 700ms gecikme).
    await tester.pump();
    expect(find.text('Providers'), findsOneWidget);
    expect(find.byType(LoadingView), findsOneWidget);

    // Mock latency sonrası loaded → kartlar render olur.
    await tester.pump(const Duration(milliseconds: 800));
    expect(find.byType(ProviderCard), findsWidgets);
  });
}
