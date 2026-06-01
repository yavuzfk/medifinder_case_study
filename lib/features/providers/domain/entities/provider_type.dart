/// Brief'teki "People & Places": provider hem kişi hem kurum olabilir.
enum ProviderType {
  doctor,
  clinic,
  hospital;

  String get label => switch (this) {
        ProviderType.doctor => 'Doctor',
        ProviderType.clinic => 'Clinic',
        ProviderType.hospital => 'Hospital',
      };
}
