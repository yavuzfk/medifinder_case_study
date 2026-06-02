import 'package:flutter/material.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_type.dart';

/// Tip → ikon eşlemesi. Domain'e Flutter sokmamak için presentation'da.
extension ProviderTypeX on ProviderType {
  IconData get icon => switch (this) {
        ProviderType.doctor => Icons.person_outline,
        ProviderType.clinic => Icons.local_hospital_outlined,
        ProviderType.hospital => Icons.apartment_outlined,
      };
}
