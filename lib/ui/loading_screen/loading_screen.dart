import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:workwave/core/route/app_routes.dart';
import 'package:workwave/core/theme/colors/app_colors.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      context.go(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Белый фон
      body: Center(
        child: LoadingAnimationWidget.stretchedDots(
          color: AppColors.deepPurple, // Цвет анимации
          size: 80,
        ),
      ),
    );
  }
}