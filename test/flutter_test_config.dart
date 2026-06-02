import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

/// Testlerde google_fonts'un ağ üzerinden font indirmesini kapatır;
/// böylece testler offline çalışır ve gürültülü fallback uyarısı üretmez.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  GoogleFonts.config.allowRuntimeFetching = false;
  await testMain();
}
