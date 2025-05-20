import 'package:flutter/material.dart';
import 'package:workwave/data/user_role.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: currentUserRole,
          builder: (_,userRole,__) {
            return Text(
              'Вы вошли как ${userRole.displayName}'
            );
          }
        ),
      ),
    );
  }
}