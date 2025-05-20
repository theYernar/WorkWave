import 'package:flutter/material.dart';
import 'package:workwave/core/route/app_router.dart';
import 'package:workwave/core/theme/colors/app_colors.dart';

void main() {
  runApp(const WorkWave());
}

class WorkWave extends StatelessWidget {
  const WorkWave({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(      

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.deepPurple,
        ),
      ),

      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router
    );
  }
}