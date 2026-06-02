import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medifinder_case_study/features/onboarding/domain/entities/onboarding_slide.dart';
import 'package:medifinder_case_study/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:medifinder_case_study/features/onboarding/domain/usecases/complete_onboarding.dart';
import 'package:medifinder_case_study/features/onboarding/domain/usecases/get_onboarding_slides.dart';
import 'package:medifinder_case_study/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:medifinder_case_study/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:medifinder_case_study/features/onboarding/presentation/bloc/onboarding_state.dart';

class _FakeOnboardingRepository implements OnboardingRepository {
  bool completed = false;

  @override
  bool get isCompleted => completed;

  @override
  Future<void> complete() async => completed = true;

  @override
  List<OnboardingSlide> getSlides() => const [
        OnboardingSlide(asset: 'a.svg', title: 'A', subtitle: ''),
        OnboardingSlide(asset: 'b.svg', title: 'B', subtitle: ''),
      ];
}

void main() {
  late _FakeOnboardingRepository repository;

  setUp(() => repository = _FakeOnboardingRepository());

  OnboardingBloc build() => OnboardingBloc(
        getSlides: GetOnboardingSlides(repository),
        completeOnboarding: CompleteOnboarding(repository),
      );

  const slides = [
    OnboardingSlide(asset: 'a.svg', title: 'A', subtitle: ''),
    OnboardingSlide(asset: 'b.svg', title: 'B', subtitle: ''),
  ];

  test('seeds initial state with slides at index 0', () {
    expect(
      build().state,
      const OnboardingState.inProgress(slides: slides, index: 0),
    );
  });

  blocTest<OnboardingBloc, OnboardingState>(
    'advances the index when not on the last slide',
    build: build,
    act: (bloc) => bloc.add(const OnboardingEvent.nextPressed()),
    expect: () => [
      const OnboardingState.inProgress(slides: slides, index: 1),
    ],
  );

  blocTest<OnboardingBloc, OnboardingState>(
    'completes onboarding when next is pressed on the last slide',
    build: build,
    seed: () => const OnboardingState.inProgress(slides: slides, index: 1),
    act: (bloc) => bloc.add(const OnboardingEvent.nextPressed()),
    expect: () => [const OnboardingState.completed()],
    verify: (_) => expect(repository.completed, isTrue),
  );

  blocTest<OnboardingBloc, OnboardingState>(
    'completes onboarding when skipped',
    build: build,
    act: (bloc) => bloc.add(const OnboardingEvent.skipped()),
    expect: () => [const OnboardingState.completed()],
    verify: (_) => expect(repository.completed, isTrue),
  );

  blocTest<OnboardingBloc, OnboardingState>(
    'tracks the index on page change',
    build: build,
    act: (bloc) => bloc.add(const OnboardingEvent.pageChanged(1)),
    expect: () => [
      const OnboardingState.inProgress(slides: slides, index: 1),
    ],
  );
}
