import 'package:flutter/material.dart';
import 'package:medifinder_case_study/core/theme/app_spacing.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({this.message, super.key});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: AppSpacing.large),
            Text(message!, textAlign: TextAlign.center),
          ],
        ],
      ),
    );
  }
}
