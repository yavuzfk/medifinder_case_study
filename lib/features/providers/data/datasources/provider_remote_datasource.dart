import 'package:medifinder_case_study/core/error/exceptions.dart';
import 'package:medifinder_case_study/features/providers/data/models/provider_model.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';

abstract interface class ProviderRemoteDataSource {
  Future<List<ProviderModel>> getProviders(ProviderFilter filter);
  Future<ProviderModel> getProviderById(String id);
}

class ProviderRemoteDataSourceImpl implements ProviderRemoteDataSource {
  ProviderRemoteDataSourceImpl({
    this.latency = const Duration(milliseconds: 700),
    this.shouldFail = false,
  });

  Duration latency;
  bool shouldFail;

  @override
  Future<List<ProviderModel>> getProviders(ProviderFilter filter) async {
    await Future<void>.delayed(latency);
    if (shouldFail) {
      throw const ServerException('Failed to load providers');
    }
    final all = _rawProviders.map(ProviderModel.fromJson).toList();
    return all.where((p) => providerMatchesFilter(p, filter)).toList();
  }

  @override
  Future<ProviderModel> getProviderById(String id) async {
    await Future<void>.delayed(latency);
    if (shouldFail) {
      throw const ServerException('Failed to load provider');
    }
    final match =
        _rawProviders.map(ProviderModel.fromJson).where((p) => p.id == id);
    if (match.isEmpty) {
      throw const NotFoundException('Provider not found');
    }
    return match.first;
  }
}

bool providerMatchesFilter(ProviderModel p, ProviderFilter f) {
  final q = f.query.trim().toLowerCase();
  final matchesQuery = q.isEmpty ||
      p.name.toLowerCase().contains(q) ||
      p.category.toLowerCase().contains(q);
  final matchesType = f.type == null || p.type == f.type!.name;
  final matchesCountry = f.country == null || p.country == f.country;
  final matchesCity = f.city == null || p.city == f.city;
  final matchesCategory = f.category == null || p.category == f.category;
  return matchesQuery &&
      matchesType &&
      matchesCountry &&
      matchesCity &&
      matchesCategory;
}

const _rawProviders = <Map<String, dynamic>>[
  {
    'id': '1', 'name': 'Dr. Emily Carter', 'type': 'doctor',
    'category': 'Cardiology', 'country': 'United States', 'city': 'New York',
    'rating': 4.8, 'phone': '+1 212 555 0101',
    'email': 'e.carter@medifinder.example',
    'website': 'https://emilycarter.example',
    'bio': 'Board-certified cardiologist with 15 years of experience.',
    'imageUrl': null,
  },
  {
    'id': '2', 'name': 'Manhattan Heart Clinic', 'type': 'clinic',
    'category': 'Cardiology', 'country': 'United States', 'city': 'New York',
    'rating': 4.5, 'phone': '+1 212 555 0150', 'email': null,
    'website': 'https://manhattanheart.example', 'bio': null, 'imageUrl': null,
  },
  {
    'id': '3', 'name': 'Dr. James Lee', 'type': 'doctor',
    'category': 'Dermatology', 'country': 'United States',
    'city': 'San Francisco', 'rating': null, 'phone': null,
    'email': 'j.lee@medifinder.example', 'website': null,
    'bio': 'Dermatologist focused on skin cancer screening.', 'imageUrl': null,
  },
  {
    'id': '4', 'name': 'SF General Hospital', 'type': 'hospital',
    'category': 'General Medicine', 'country': 'United States',
    'city': 'San Francisco', 'rating': 4.2, 'phone': '+1 415 555 0199',
    'email': 'info@sfgeneral.example', 'website': 'https://sfgeneral.example',
    'bio': 'Full-service public hospital.', 'imageUrl': null,
  },
  {
    'id': '5', 'name': 'Dr. Olivia Brown', 'type': 'doctor',
    'category': 'Pediatrics', 'country': 'United Kingdom', 'city': 'London',
    'rating': 4.9, 'phone': '+44 20 7946 0102', 'email': null,
    'website': null, 'bio': null, 'imageUrl': null,
  },
  {
    'id': '6', 'name': 'London Skin Clinic', 'type': 'clinic',
    'category': 'Dermatology', 'country': 'United Kingdom', 'city': 'London',
    'rating': 4.4, 'phone': '+44 20 7946 0170',
    'email': 'hello@londonskin.example', 'website': 'https://londonskin.example',
    'bio': 'Cosmetic and medical dermatology.', 'imageUrl': null,
  },
  {
    'id': '7', 'name': 'Dr. Liam Wilson', 'type': 'doctor',
    'category': 'Orthopedics', 'country': 'United Kingdom', 'city': 'Manchester',
    'rating': 4.1, 'phone': null, 'email': null, 'website': null,
    'bio': 'Orthopedic surgeon specializing in sports injuries.',
    'imageUrl': null,
  },
  {
    'id': '8', 'name': 'Charite Universitatsmedizin', 'type': 'hospital',
    'category': 'General Medicine', 'country': 'Germany', 'city': 'Berlin',
    'rating': 4.7, 'phone': '+49 30 4505 0', 'email': 'info@charite.example',
    'website': 'https://charite.example',
    'bio': 'One of Europe largest university hospitals.', 'imageUrl': null,
  },
  {
    'id': '9', 'name': 'Dr. Sophie Muller', 'type': 'doctor',
    'category': 'Cardiology', 'country': 'Germany', 'city': 'Berlin',
    'rating': null, 'phone': '+49 30 5555 0123', 'email': null,
    'website': null, 'bio': null, 'imageUrl': null,
  },
  {
    'id': '10', 'name': 'Bavaria Dental Center', 'type': 'clinic',
    'category': 'Dentistry', 'country': 'Germany', 'city': 'Munich',
    'rating': 4.6, 'phone': '+49 89 5555 0144',
    'email': 'kontakt@bavariadental.example', 'website': null,
    'bio': 'Modern dental clinic.', 'imageUrl': null,
  },
  {
    'id': '11', 'name': 'Dr. Elif Yilmaz', 'type': 'doctor',
    'category': 'Cardiology', 'country': 'Turkey', 'city': 'Istanbul',
    'rating': 4.9, 'phone': '+90 212 555 0101',
    'email': 'e.yilmaz@medifinder.example', 'website': null,
    'bio': 'Interventional cardiologist at a leading Istanbul hospital.',
    'imageUrl': null,
  },
  {
    'id': '12', 'name': 'Istanbul Medical Center', 'type': 'hospital',
    'category': 'General Medicine', 'country': 'Turkey', 'city': 'Istanbul',
    'rating': 4.5, 'phone': '+90 212 555 0188',
    'email': 'info@istanbulmedical.example',
    'website': 'https://istanbulmedical.example',
    'bio': 'Private full-service hospital on the European side.',
    'imageUrl': null,
  },
  {
    'id': '13', 'name': 'Bosphorus Dental Clinic', 'type': 'clinic',
    'category': 'Dentistry', 'country': 'Turkey', 'city': 'Istanbul',
    'rating': 4.7, 'phone': null, 'email': null,
    'website': 'https://bosphorusdental.example', 'bio': null, 'imageUrl': null,
  },
  {
    'id': '14', 'name': 'Dr. Mehmet Demir', 'type': 'doctor',
    'category': 'Orthopedics', 'country': 'Turkey', 'city': 'Ankara',
    'rating': 4.3, 'phone': '+90 312 555 0144', 'email': null,
    'website': null,
    'bio': 'Orthopedic surgeon focused on joint replacement.',
    'imageUrl': null,
  },
  {
    'id': '15', 'name': 'Aegean Dermatology Clinic', 'type': 'clinic',
    'category': 'Dermatology', 'country': 'Turkey', 'city': 'Izmir',
    'rating': null, 'phone': '+90 232 555 0170',
    'email': 'hello@aegeanderma.example', 'website': null,
    'bio': 'Medical and cosmetic dermatology.', 'imageUrl': null,
  },
  {
    'id': '16', 'name': 'Dr. Zeynep Kaya', 'type': 'doctor',
    'category': 'Pediatrics', 'country': 'Turkey', 'city': 'Bursa',
    'rating': 4.6, 'phone': '+90 224 555 0123', 'email': null,
    'website': null, 'bio': null, 'imageUrl': null,
  },
];
