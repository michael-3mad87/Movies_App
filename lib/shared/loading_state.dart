import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppTheme.gold,
      ),
    );
  }
}