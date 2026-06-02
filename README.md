# MediFinder

Doktor, klinik ve hastane (“People & Places”) arayıp filtrelemeyi ve detaylarını
görüntülemeyi sağlayan bir Flutter mobil uygulaması. Backend yok; veri, gerçek bir
servisi taklit eden “akıllı” bir mock veri kaynağından gelir.

Üç ekran: **Liste → Filtre → Detay**, artı ilk açılışta bir kez gösterilen
illüstrasyonlu **Onboarding**.

---

## Özellikler

- **Liste:** Debounce’lu arama (300 ms), tip hızlı filtre çipleri (Tümü/Doktorlar/
  Klinikler/Hastaneler), aşağı çekip yenileme, skeleton (iskelet) loading.
- **Filtre:** Cascading **ülke → şehir → branş** (şehir seçenekleri ülkeye bağlı),
  önceki seçimleri hatırlama, Sıfırla/Uygula.
- **Detay:** Eksik alanların (telefon/e‑posta/web/bio/puan) zarifçe gizlendiği,
  asla “null” yazmayan görünüm; hata + tekrar dene.
- **Her async ekran** loading / empty / error durumlarını açıkça gösterir; sessiz
  sonsuz spinner yok.
- Material 3, Inter tipografi, sakin medikal görsel dil. Arayüz dili **Türkçe**.

---

## Mimari

Temiz mimari, **feature‑first** klasörleme:

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

**Bağımlılık yönü:** `presentation → domain ← data`. Domain saf Dart’tır
(Flutter/paket bağımlılığı yok); katmanlar yalnızca domain üzerinden konuşur —
presentation asla data’yı, data asla presentation’ı import etmez.

**Neden böyle?** İş kurallarını (domain) framework ve veri kaynağından yalıtmak,
mock datasource’u ileride gerçek bir API ile değiştirmeyi tek satırlık bir DI
değişikliğine indirger; domain ve bloc testleri Flutter’a ihtiyaç duymadan saf
ve hızlı kalır.

---

## State yönetimi

Her feature için **BLoC** (Event → State → Bloc) kullanıldı; Cubit tercih
edilmedi çünkü kullanıcı niyetini (event) açıkça modellemek, debounce gibi
event‑dönüşümlerini ve test edilebilirliği kolaylaştırıyor.

- **State’ler freezed `sealed` union’dır** (ör. `Initial / Loading / Loaded /
  Empty / Error`) ve UI tarafında `switch` ile **exhaustive** eşleştirilir —
  unutulan bir durum derleme hatası olur, sessizce boş ekran çıkmaz.
- Bloc, bir tür **ViewModel** rolü üstlenir: tüm ekran durumu ve mantığı orada
  yaşar, widget’lar yalnızca state’i çizer. İş mantığı widget’a sızmaz.
- **Arama debounce’u** UI’da değil, bloc’ta bir `EventTransformer` ile yapılır
  (`stream_transform` → `debounce().switchMap()`), böylece yalnızca son sorgu
  çalışır.

### Hata akışı — `Result<T>` + `Failure`

Repository ve use case’ler exception fırlatmaz; tip‑güvenli bir sonuç döner:

```dart
sealed class Result<T> { const Result(); }
final class Success<T> extends Result<T> { const Success(this.data); final T data; }
final class ResultFailure<T> extends Result<T> { const ResultFailure(this.failure); final Failure failure; }
```

Exception’lar **data katmanında yakalanır** ve bir `Failure`’a (server/cache/
network/notFound/unknown — freezed sealed) çevrilir; üst katmanlara asla exception
sızmaz. Bloc, `Failure`’ı kullanıcıya gösterilecek Türkçe bir mesaja eşler.

---

## Önemli teknik kararlar

- **Modüler DI (`get_it`):** Her feature kendi `register<Feature>(GetIt)`
  fonksiyonunu sunar; `configureDependencies()` bunları çağırır. Codegen tabanlı
  DI (injectable) yerine elle kayıt — daha az sihir, daha okunur.
- **Navigasyon (`go_router`):** İsimli route sabitleri (`AppRoutes`) ve onboarding
  için `redirect`. Onboarding bayrağı router’a doğrudan Hive ile değil, test
  edilebilir bir `OnboardingStore` arayüzü üzerinden okunur.
- **Kalıcılık (`hive_ce`):** Şu an yalnızca onboarding’in bir kez gösterilmesi
  için kullanılır. Sağlayıcıların offline cache’i bilinçli olarak sonraki adıma
  bırakıldı; altyapı (`ProviderModel.toJson`, açık `app` kutusu) hazır.
- **Akıllı mock datasource:** Gecikme (`latency`), hata (`shouldFail`) ve boş
  sonuç üretebilir; böylece loading/error/empty durumlarının üçü de gerçekten
  tetiklenebilir ve demo edilebilir. Veri setinde bilinçli `null` alanlar var
  (detaydaki null yönetimini göstermek için).
- **Freezed 3.x:** Veri sınıfları `@freezed abstract`, union’lar `@freezed
  sealed`; `.map/.when` yerine `switch`. JSON yalnızca data modelinde.
- **Bağımlılık kararı:** Bu Flutter sürümünde `bloc_test` ile `hive_ce_generator`
  aynı anda çözülemiyordu (`test_api` sürüm sabiti çakışması). `bloc_test`
  korundu; Hive adapter’ları üretmek yerine cache JSON string olarak
  saklanacak şekilde tasarlandı.
- **Lint:** `very_good_analysis` (katı kural seti). Repo `flutter analyze` ile
  **sıfır uyarı** verir.

---

## Test stratejisi

Kapsam yüzdesi yerine **anlamlı testler** hedeflendi: asıl mantığın yaşadığı
yerler (exception→Failure eşlemesi, bloc durum geçişleri, null yönetimi).

- **Repository (mocktail):** datasource exception’larının doğru `Failure`’a
  eşlendiğini doğrular.
- **Bloc (`bloc_test`):** liste loaded/empty/error + debounce’lu arama; filtre
  pre‑fill/error + cascading şehir sıfırlama; detay loaded/not‑found.
- **Widget:** detay ekranının eksik alanları gizleyip dolu alanları gösterdiği;
  onboarding akışı; uygulamanın açılış smoke testi (skeleton → kartlar).

Örnek — bloc durum geçişi:

```dart
blocTest<ProviderListBloc, ProviderListState>(
  'emits [loading, empty] when result is empty',
  setUp: () => when(() => getProviders(any()))
      .thenAnswer((_) async => const Success(<Provider>[])),
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
test('maps ServerException to Failure.server', () async {
  when(() => local.getProviders(any())).thenThrow(const ServerException('boom'));
  final result = await repository.getProviders(const ProviderFilter());
  expect((result as ResultFailure).failure, isA<ServerFailure>());
});
```

---

## Hata yönetimi, retry & offline

- Her ekran hatada **kullanıcı dostu Türkçe bir mesaj** ve **Tekrar dene** butonu
  gösterir (`ErrorView(onRetry:)`); bloc, `refreshed`/`retried` event’iyle son
  isteği yineler.
- Hata durumunu canlı demo edebilmek için liste başlığında **yalnızca debug’da
  görünen** bir “sahte hata” düğmesi var (`kDebugMode`); açıldığında datasource
  hata fırlatır → error/retry akışı tetiklenir.
- **Offline cache** henüz uygulanmadı; doğal sonraki adım, repository’ye Hive
  tabanlı bir “önce cache, sonra ağ” katmanı eklemek (model `toJson` ve `app`
  kutusu hazır).

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

> İlk açılışta onboarding görünür. Tekrar görmek için uygulamayı silip yeniden
> kurun (onboarding bayrağı cihazda saklanır).

---

## Teknoloji

Flutter · flutter_bloc · go_router · get_it · freezed · hive_ce ·
stream_transform · google_fonts · flutter_svg · skeletonizer ·
bloc_test + mocktail · very_good_analysis.
