import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/core/router/app_routes.dart';
import 'package:medifinder_case_study/core/theme/app_colors.dart';
import 'package:medifinder_case_study/core/theme/app_radii.dart';
import 'package:medifinder_case_study/core/theme/app_spacing.dart';
import 'package:medifinder_case_study/features/onboarding/domain/entities/onboarding_slide.dart';
import 'package:medifinder_case_study/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:medifinder_case_study/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:medifinder_case_study/features/onboarding/presentation/bloc/onboarding_state.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OnboardingBloc>(),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  final _controller = PageController();

  static const _slidePadding = EdgeInsets.symmetric(horizontal: 32);
  static const _illustrationHeight = 240.0;
  static const _illustrationGap = 40.0;
  static const _dotSize = 8.0;
  static const _dotActiveWidth = 24.0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  OnboardingBloc get _bloc => context.read<OnboardingBloc>();

  void _onStateChanged(BuildContext context, OnboardingState state) {
    switch (state) {
      case OnboardingCompleted():
        context.go(AppRoutes.providerList);
      case OnboardingInProgress(:final index):
        if (_controller.hasClients &&
            (_controller.page?.round() ?? 0) != index) {
          unawaited(
            _controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            ),
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<OnboardingBloc, OnboardingState>(
          listener: _onStateChanged,
          builder: (context, state) {
            if (state is! OnboardingInProgress) {
              return const SizedBox.shrink();
            }
            final isLast = state.index == state.slides.length - 1;
            return Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () =>
                        _bloc.add(const OnboardingEvent.skipped()),
                    child: const Text('Atla'),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (i) =>
                        _bloc.add(OnboardingEvent.pageChanged(i)),
                    itemCount: state.slides.length,
                    itemBuilder: (context, i) => _Slide(slide: state.slides[i]),
                  ),
                ),
                _Dots(count: state.slides.length, index: state.index),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.extraLarge),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () =>
                          _bloc.add(const OnboardingEvent.nextPressed()),
                      child: Text(isLast ? 'Başla' : 'İleri'),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({required this.slide});

  final OnboardingSlide slide;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: _OnboardingViewState._slidePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            slide.asset,
            height: _OnboardingViewState._illustrationHeight,
          ),
          const SizedBox(height: _OnboardingViewState._illustrationGap),
          Text(
            slide.title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppSpacing.medium),
          Text(
            slide.subtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.inkMuted),
          ),
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.extraSmall),
          height: _OnboardingViewState._dotSize,
          width: active
              ? _OnboardingViewState._dotActiveWidth
              : _OnboardingViewState._dotSize,
          decoration: BoxDecoration(
            color: active
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(AppRadii.dot),
          ),
        );
      }),
    );
  }
}
