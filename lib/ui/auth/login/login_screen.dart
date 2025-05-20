import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:workwave/core/route/app_routes.dart';
import 'package:workwave/core/theme/colors/app_colors.dart';
import 'package:workwave/data/user_role.dart';
import 'package:workwave/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: ()=> context.pop(), icon: Icon(HugeIcons.strokeRoundedArrowLeft01)),
        title: Text(
          'Вход'
        ),
        centerTitle: true,
      ),

      body: _HeaderWidget(),
    );
  }
}

class _HeaderWidget extends StatefulWidget {
  const _HeaderWidget({
    super.key,
  });

  @override
  State<_HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<_HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 50,),

          Text(
            'Почта',
            style: TextStyle(
              fontSize: 15
            ),
          ),
          const SizedBox(height: 4,),
          _TextFieldBuilder(title: 'Почта', icon: HugeIcons.strokeRoundedMail01,isPassword: false),
          const SizedBox(height: 14,),

          Text(
            'Пароль',
            style: TextStyle(
              fontSize: 15
            ),
          ),
          const SizedBox(height: 4,),
          _TextFieldBuilder(title: 'Пароль', icon: HugeIcons.strokeRoundedLockPassword, isPassword: false),

          const SizedBox(height: 30,),
          CustomButton(title: 'Войти', onTap: (){ 
            setState(() {
              currentUserRole.value = UserRole.student;
              context.go(AppRoutes.profile);
            });
          }),


          
        ],
      ),
    );
  }

  TextField _TextFieldBuilder({
    required String title,
    required IconData icon,
    required bool isPassword,
  }) {
    return TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            prefixIcon: Icon(icon),
            hintText: title,

            // suffix: IconButton(onPressed: (){}, icon: Icon(HugeIcons.strokeRoundedEye)),
            suffixIcon: isPassword ? IconButton(onPressed: (){}, icon: Icon(HugeIcons.strokeRoundedViewOffSlash)) : const SizedBox(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: AppColors.deepPurple,
                width: 2
              )
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            )
          ),
        );
  }
}