import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workwave/core/route/app_routes.dart';
import 'package:workwave/ui/onboarding/widgets/custom_button.dart';

class SecondOnboardingScreen extends StatelessWidget {
  final PageController pageController;
  const SecondOnboardingScreen({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [


          // ==========

          Expanded(
            child: SingleChildScrollView(
              child: _HeaderWidget(),
            )
          ),


          // ==========

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(title: 'Начать', onTap: (){
              context.go(AppRoutes.home);
            }),
          )

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
            'Second'
          )
        ],
      ),
    );
  }
}
