# MediFinder

Doktor, klinik ve hastane (“People & Places”) arayıp filtrelemeyi ve detaylarını
görüntülemeyi sağlayan Flutter ile geliştirilmiş bir mobil uygulama. Backend yok; veri, gerçek bir
servisi taklit eden mock veri kaynağından gelir.

---

## Demo

<video src="https://github.com/yavuzfk/medifinder_case_study/raw/main/docs/demo.mp4" controls width="320"></video>

> Oynatıcı görünmüyorsa: [docs/demo.mp4](docs/demo.mp4)

---

## Tech stack

- **State management:** flutter_bloc
- **Navigation:** go_router
- **DI:** get_it
- **Codegen & models:** freezed, json_serializable
- **Local storage:** hive_ce
- **UI:** google_fonts, flutter_svg, skeletonizer
- **Streams:** stream_transform
- **Testing & lint:** bloc_test, mocktail, very_good_analysis

---

## Mimari

Clean architecture, **feature‑first** klasörleme:

```
lib/
├── core/                      # uygulama geneli altyapı
│   ├── di/                    # get_it servis kaydı
│   ├── error/                 # Failure (sealed), Exception'lar
│   ├── router/                # go_router + isimli route'lar
│   ├── theme/                 # Material 3 tema, renk paleti
│   ├── utils/                 # Result<T>
│   └── widgets/               # LoadingView / EmptyView / ErrorView
└── features/
    ├── onboarding/            # tek seferlik tanıtım akışı
    └── providers/
        ├── domain/            # entity'ler, repository sözleşmesi, use case'ler
        ├── data/              # model+mapper, mock datasource, repository impl
        └── presentation/      # bloc + pages + widgets
```

**Bağımlılık yönü:** `presentation → domain ← data`. Domain saf Dart; paket bağımlılığı yok.

---

## State yönetimi

Her feature için **BLoC** (Event → State → Bloc) kullanıldı; Cubit tercih
edilmedi çünkü kullanıcı eventlerini açıkça modellemek, debounce gibi
event‑dönüşümlerini ve test edilebilirliği kolaylaştırıyor. Bu yapıda Bloc, ViewModel gibi bir çalışma mantığına sahip.

### Hata akışı — `Result<T>` + `Failure`

Repository ve use case’ler exception fırlatmaz; tip‑güvenli bir sonuç döner:

```dart
sealed class Result<T> { const Result(); }
final class Success<T> extends Result<T> { const Success(this.data); final T data; }
final class ResultFailure<T> extends Result<T> { const ResultFailure(this.failure); final Failure failure; }
```

---

## Test stratejisi

Kapsam yüzdesi peşinde koşmak yerine mantığın yoğun olduğu yerlere odaklandım:
exception → Failure eşlemesi, bloc durum geçişleri ve null yönetimi.

Örnek — bloc durum geçişi:

```dart
blocTest<ProviderListBloc, ProviderListState>(
  'emits [loading, empty] when result is empty',
  setUp: () => when(() => getProviders(any())).thenAnswer(
    (_) async => const Success((value: <Provider>[], fromCache: false)),
  ),
  build: build,
  act: (bloc) => bloc.add(const ProviderListEvent.started()),
  expect: () => [
    const ProviderListState.loading(),
    const ProviderListState.empty(),
  ],
);
```

Örnek — exception → Failure eşlemesi:

```dart
test('returns Failure.server when remote fails and cache is empty', () async {
  when(() => remote.getProviders(any())).thenThrow(const ServerException('boom'));
  final result = await repository.getProviders(const ProviderFilter());
  expect((result as ResultFailure).failure, isA<ServerFailure>());
});
```

---

## Offline & önbellek

Bir istek hata verdiğinde ekran, Türkçe bir mesajla birlikte bir **Tekrar dene**
butonu gösteriyor; bloc son isteği yineliyor.

Remote her başarılı olduğunda tüm katalog Hive’a yazılıyor; sonraki bir istek
hata verirse repository aynı filtreleme mantığıyla bu önbellekten okuyor, böylece
arama, filtre ve detay çevrimdışıyken de çalışmaya devam ediyor. Veri önbellekten
geldiğinde ekranın üstünde **“Çevrimdışı — önbellekten gösteriliyor”** çubuğu
beliriyor.

Gerçek bir backend olmadığı için “çevrimdışı” demek, mock’un hata fırlatması
demek. Bunu canlı denemek için liste başlığında yalnızca debug derlemesinde
görünen bir böcek ikonu (**“Çevrimdışı simüle et”**) var: dokununca mock hata
verir hâle geliyor; böylece hem retry hem de önbellekten okuma + banner senaryosu
yerinde görülebiliyor.

---

## Kurulum & çalıştırma

Gereksinim: Flutter (stable, 3.35+) / Dart 3.9+.

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # freezed/json kod üretimi
flutter run                                                 # iOS / Android

flutter analyze                                             # 0 uyarı
flutter test                                                # tüm testler
```
