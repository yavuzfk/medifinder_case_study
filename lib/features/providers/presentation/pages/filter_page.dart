import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medifinder_case_study/core/di/injection.dart';
import 'package:medifinder_case_study/core/widgets/error_view.dart';
import 'package:medifinder_case_study/core/widgets/loading_view.dart';
import 'package:medifinder_case_study/features/providers/domain/entities/provider_filter.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/filter_bloc.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/filter_event.dart';
import 'package:medifinder_case_study/features/providers/presentation/bloc/filter_state.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({this.initialFilter, super.key});

  final ProviderFilter? initialFilter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FilterBloc>()
        ..add(FilterEvent.started(initialFilter ?? const ProviderFilter())),
      child: const _FilterView(),
    );
  }
}

class _FilterView extends StatelessWidget {
  const _FilterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtrele'),
        actions: [
          BlocBuilder<FilterBloc, FilterState>(
            builder: (context, state) {
              if (state is! FilterReady) return const SizedBox.shrink();
              return TextButton(
                onPressed: () =>
                    context.read<FilterBloc>().add(const FilterEvent.cleared()),
                child: const Text('Sıfırla'),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return switch (state) {
            FilterLoading() => const LoadingView(),
            FilterError(:final message) => ErrorView(
                message: message,
                onRetry: () => context.read<FilterBloc>().add(
                      const FilterEvent.started(ProviderFilter()),
                    ),
              ),
            FilterReady() => _FilterForm(state: state),
          };
        },
      ),
    );
  }
}

class _FilterForm extends StatelessWidget {
  const _FilterForm({required this.state});

  final FilterReady state;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FilterBloc>();
    final cities = state.country == null
        ? const <String>[]
        : (state.options.citiesByCountry[state.country] ?? const <String>[]);

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _Dropdown(
                label: 'Ülke',
                value: state.country,
                allLabel: 'Tüm ülkeler',
                items: state.options.countries,
                onChanged: (v) => bloc.add(FilterEvent.countrySelected(v)),
              ),
              const SizedBox(height: 16),
              _Dropdown(
                label: 'Şehir',
                value: state.city,
                allLabel: 'Tüm şehirler',
                items: cities,
                // Cascading: ülke seçilmeden şehir pasif.
                enabled: state.country != null,
                onChanged: (v) => bloc.add(FilterEvent.citySelected(v)),
              ),
              const SizedBox(height: 16),
              _Dropdown(
                label: 'Branş',
                value: state.category,
                allLabel: 'Tüm branşlar',
                items: state.options.categories,
                onChanged: (v) => bloc.add(FilterEvent.categorySelected(v)),
              ),
            ],
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => context.pop(
                  ProviderFilter(
                    country: state.country,
                    city: state.city,
                    category: state.category,
                  ),
                ),
                child: const Text('Uygula'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Dropdown extends StatelessWidget {
  const _Dropdown({
    required this.label,
    required this.value,
    required this.allLabel,
    required this.items,
    required this.onChanged,
    this.enabled = true,
  });

  final String label;
  final String? value;
  final String allLabel;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String?>(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: [
        DropdownMenuItem(child: Text(allLabel)),
        ...items.map(
          (item) => DropdownMenuItem(value: item, child: Text(item)),
        ),
      ],
      onChanged: enabled ? onChanged : null,
    );
  }
}
