import 'package:flutter/material.dart';
import 'package:workwave/core/theme/colors/app_colors.dart';
import 'package:workwave/resources/resources.dart';
import 'package:workwave/widgets/custom_button.dart';

class FirstOnboardingScreen extends StatelessWidget {
  final PageController pageController;
  const FirstOnboardingScreen({super.key, required this.pageController});

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
                  AppImages.image1,
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
                  'Найди себя вместе с \nWork Wave',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Твой первый шаг в мир профессий. Находи стажировки, вакансии и запускай карьеру уже во время учёбы.',
                  style: TextStyle(
                    color: AppColors.silver,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  title: 'Далее',
                  onTap: () {
                    pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
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
