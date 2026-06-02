import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/core/router/app_routes.dart';
import 'package:medifinder_case_study/core/theme/app_theme.dart';
import 'package:medifinder_case_study/features/onboarding/onboarding_store.dart';

class _Slide {
  const _Slide(this.asset, this.title, this.subtitle);
  final String asset;
  final String title;
  final String subtitle;
}

const _slides = <_Slide>[
  _Slide(
    'assets/illustrations/discover.svg',
    'Doğru bakımı bulun',
    'Dünya genelinde güvenilir doktorları, klinikleri ve hastaneleri arayın.',
  ),
  _Slide(
    'assets/illustrations/filter.svg',
    'Güvenle filtreleyin',
    'Doğru uzmana hızla ulaşmak için ülke, şehir ve branşa göre daraltın.',
  ),
  _Slide(
    'assets/illustrations/decide.svg',
    'Net karar verin',
    'Branşları, puanları ve iletişim bilgilerini tek bakışta görün.',
  ),
];

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isLast => _index == _slides.length - 1;

  Future<void> _finish() async {
    await getIt<OnboardingStore>().complete();
    if (mounted) context.go(AppRoutes.providerList);
  }

  Future<void> _next() async {
    if (_isLast) {
      await _finish();
    } else {
      await _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _finish,
                child: const Text('Atla'),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (i) => setState(() => _index = i),
                itemCount: _slides.length,
                itemBuilder: (context, i) {
                  final s = _slides[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(s.asset, height: 240),
                        const SizedBox(height: 40),
                        Text(
                          s.title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          s.subtitle,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(color: AppColors.inkMuted),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _slides.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _index == i ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _index == i
                        ? AppColors.primary
                        : AppColors.primary.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _next,
                  child: Text(_isLast ? 'Başla' : 'İleri'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
