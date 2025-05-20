import 'package:flutter/material.dart';
import 'package:workwave/ui/onboarding/widgets/custom_button.dart';

class FirstOnboardingScreen extends StatelessWidget {
  final PageController pageController;
  const FirstOnboardingScreen({super.key, required this.pageController});

  void nextNavigate() {
    pageController.animateToPage(
      1, 
      duration: const Duration(milliseconds: 500), 
      curve: Curves.easeInOut,
    );
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // ==========

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: _HeaderWidget(),
            )
          ),



          // ========== Next Button ========== //
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(title: 'Далее', onTap: nextNavigate, ),
          ),

        ],
      ),
    );
  }
}




class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            'First',
          )
        ],
      ),
    );
  }
}





