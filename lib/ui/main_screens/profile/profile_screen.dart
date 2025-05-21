// import 'package:go_router/go_router.dart';
// import 'package:workwave/core/route/app_routes.dart';
// import 'package:workwave/core/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:workwave/data/user_role.dart';
import 'package:workwave/ui/main_screens/profile/employer/employer_profile.dart';
import 'package:workwave/ui/main_screens/profile/institution/institution_profile.dart';
import 'package:workwave/ui/main_screens/profile/student/student_profile.dart';

import 'guest/guest_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserRole>(
      valueListenable: currentUserRole,
      builder: (_, userRole, __) {

        switch (userRole){
          case UserRole.guest:
            return GuestProfile();
          case UserRole.student:
            return StudentProfile();
          case UserRole.employer:
            return EmployerProfile();
          case UserRole.institution:
            return InstitutionProfile();
        }

      },
    );
  }
}