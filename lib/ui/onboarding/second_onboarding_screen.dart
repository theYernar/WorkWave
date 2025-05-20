import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workwave/core/route/app_routes.dart';
import 'package:workwave/core/theme/colors/app_colors.dart';
import 'package:workwave/resources/resources.dart';
import 'package:workwave/widgets/custom_button.dart';

class SecondOnboardingScreen extends StatelessWidget {
  final PageController pageController;
  const SecondOnboardingScreen({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          // ========== Фоновое изображение с градиентом ==========
          Positioned.fill(
            child: Stack(
              children: [
                Image.asset(
                  AppImages.image2,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black87,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ========== Контент ==========
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  'Начни карьеру уже сегодня',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Работай над реальными задачами, прокачивай резюме и выходи на новый уровень ещё до выпуска.',
                  style: TextStyle(
                    color: AppColors.silver,
                    fontSize: 18,
                  ),
                ),


                const SizedBox(height: 20),
                CustomButton(
                  title: 'Приступить',
                  onTap: () {
                    context.go(AppRoutes.loading);
                  },
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}


