enum ProviderType {
  doctor,
  clinic,
  hospital;

  String get label => switch (this) {
        ProviderType.doctor => 'Doktor',
        ProviderType.clinic => 'Klinik',
        ProviderType.hospital => 'Hastane',
      };
}
