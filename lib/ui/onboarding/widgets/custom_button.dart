import 'package:flutter/material.dart';
import 'package:workwave/core/theme/colors/app_colors.dart';


class CustomButton extends StatelessWidget {

  final String title;
  final Function() onTap;

  // final PageController pageController;
  const CustomButton({
    super.key,
    // required this.pageController,
    required this.title, required this.onTap,
  });



  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.deepPurple,
          borderRadius: BorderRadius.circular(14)
        ),
      
      
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
      
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: onTap,
              ),
            )
          ],
        ),
      ),
    );
  }
}