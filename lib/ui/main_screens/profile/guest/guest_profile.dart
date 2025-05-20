import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workwave/core/route/app_routes.dart';
import 'package:workwave/core/theme/colors/app_colors.dart';

class GuestProfile extends StatelessWidget {
  const GuestProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [


          InkWell(
            onTap: (){
              context.push(AppRoutes.login);
            },
            borderRadius: BorderRadius.circular(14),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.deepPurple),
                borderRadius: BorderRadius.circular(14)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Войти'
              ),
            ),
          ),


          const SizedBox(height: 15,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'У вас еще нет аккаунта?'
              ),
              const SizedBox(width: 10,),
              InkWell(
                onTap: (){
                  context.push(AppRoutes.registration);
                },
                child: Text(
                  'Создать',
                  style: TextStyle(
                    color: AppColors.deepPurple
                  ),
                ),
              )
            ],
          )

        ],
      )
    );
  }
}