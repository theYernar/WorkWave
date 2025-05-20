import 'package:flutter/widgets.dart';

enum UserRole {
  guest,
  student,
  employer,
  institution,
}

extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.guest:
        return 'Гость';
      case UserRole.student:
        return 'Студент';
      case UserRole.employer:
        return 'Работодатель';
      case UserRole.institution:
        return 'Учебное заведение';
    }
  }
}



final ValueNotifier<UserRole> currentUserRole = ValueNotifier<UserRole>(UserRole.guest);
