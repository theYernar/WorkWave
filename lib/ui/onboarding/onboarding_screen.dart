import 'package:flutter/material.dart';
import 'package:workwave/ui/onboarding/first_onboarding_screen.dart';
import 'package:workwave/ui/onboarding/second_onboarding_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  PageController _pageController = PageController();
  
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        FirstOnboardingScreen(pageController: _pageController, key: PageStorageKey('1'),),
        SecondOnboardingScreen(pageController: _pageController, key: PageStorageKey('2'),),
      ],
    );
  }
}
