import 'package:flutter_test/flutter_test.dart';
import 'package:medifinder_case_study/main.dart';

void main() {
  testWidgets('App boots into the provider list route', (tester) async {
    await tester.pumpWidget(const MediFinderApp());
    await tester.pumpAndSettle();

    // İlk route (AppRoutes.providerList) placeholder ekranını göstermeli.
    expect(find.text('Provider List'), findsWidgets);
  });
}
