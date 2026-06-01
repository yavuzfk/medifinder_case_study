# MediFinder — CLAUDE.md

Mobile engineer case study. Flutter, 3 screens: **Provider List → Filter → Provider Detail**. Mock data only, no backend. Goal: clean, production-near code that proves solid architecture.

## Stack
Flutter · flutter_bloc · go_router · get_it · freezed (3.x) · hive_ce · very_good_analysis · bloc_test + mocktail.

## Architecture — Clean, feature-first
```
lib/core/{di,error,router,theme,widgets,utils}
lib/features/<feature>/{domain,data,presentation}
```
Dependency direction: `presentation → domain ← data`. Domain has no Flutter/package deps. Layers cross only through domain — never import data from presentation or vice versa.

## Hard rules (getting these wrong breaks build or review)
- **Freezed 3.x**: data classes = `@freezed abstract class`; unions/states = `@freezed sealed class`. NO `.map`/`.when` — use `switch` pattern matching. Add `part 'x.freezed.dart';` (+ `'x.g.dart'` if JSON), then run codegen.
- **State mgmt**: BLoC only — Event / State / Bloc per feature. **No Cubit.** States are freezed sealed unions (e.g. Initial / Loading / Loaded / Empty / Error).
- **Error flow**: repositories & usecases return `Result<T>` (`Success` / `ResultFailure(Failure)`). Never let exceptions cross a layer — catch at the data layer and map to `Failure`.
- **Storage**: `hive_ce` / `hive_ce_flutter` only — never the old `hive`.
- **Navigation**: `go_router` via `AppRoutes` name constants; `context.pushNamed(...)`, never raw path strings.
- **DI**: `get_it`. Each feature exposes `register<Feature>(GetIt gh)`, called from `configureDependencies()`. No `injectable` / codegen DI.

## UX & data states (explicitly graded)
- Every async screen renders **loading / empty / error** via `LoadingView`, `EmptyView`, `ErrorView(onRetry:)`. No infinite silent spinners.
- Mock datasource MUST be able to trigger: latency (`Future.delayed`), failure (throw → `Failure`), and empty results — so all states are reachable and demoable.
- Treat all fields as nullable. Detail screen handles missing phone/bio/rating gracefully (hide the row or show a placeholder; never crash, never render the text "null").

## Domain notes
- `Provider` entity carries a `ProviderType` enum: `doctor`, `clinic`, `hospital` (the brief's "People & Places"). UI adapts label/icon by type.
- Filters: country → city (cascading: city options depend on selected country) → category. Search query + active filters live in one state and compose.
- Debounce the search input (~300ms).

## Testing
`bloc_test` for every Bloc; unit-test usecases and the repository (mock datasource with `mocktail`); a few widget tests covering list loading/empty/error. Prefer meaningful tests over coverage %.

## Commands
```
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```

## Workflow
Small feature branches → PR to main. Conventional commits (`feat:`, `fix:`, `test:`, `chore:`, `docs:`). Keep the app compiling and runnable at every merge.

## Don't
No business logic in widgets. No datasource calls from presentation. No `print`. No new state-management or DI libraries. Don't expand scope beyond the 3 screens.
