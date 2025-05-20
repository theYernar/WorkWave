import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:workwave/core/route/app_routes.dart';

class MainScreens extends StatefulWidget {
  final String? path;
  final Widget child;

  const MainScreens({super.key, this.path, required this.child});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {


  int _currentIndex = 0;

  void setIndex () {
    switch (widget.path){
      case AppRoutes.home:
        _currentIndex = 0;
        break;
      case AppRoutes.vacancies:
        _currentIndex = 1;
        break;
      case AppRoutes.map:
        _currentIndex = 2;
        break;
      case AppRoutes.chat:
        _currentIndex = 3;
        break;
      case AppRoutes.profile:
        _currentIndex = 4;
        break;
    }
  }



  void _onTabItem(int index){
    setState(() => _currentIndex = index);
    switch (index) {
      case 0:
        context.go(AppRoutes.home);
        break;
      case 1:
        context.go(AppRoutes.vacancies);
        break;
      case 2:
        context.go(AppRoutes.map);
        break;
      case 3:
        context.go(AppRoutes.chat);
        break;
      case 4:
        context.go(AppRoutes.profile);
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    setIndex();

    final List<BottomNavigationBarItem> _bottomBarItem = [
      BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedHome01,), label: 'Главная'),
      BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedWork,), label: 'Вакансии'),
      BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedLocation04,), label: 'Карта'),
      BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedMessage02,), label: 'Чат'),
      BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedUserCircle02,), label: 'Профиль'),
    ];




    return Scaffold(
      body: widget.child,

      
      
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(height: 0, color: const Color.fromARGB(88, 76, 125, 130),),
            BottomNavigationBar(
              items: _bottomBarItem,
              onTap: _onTabItem,
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
            ),
          ],
        ),
      ),
    );
  }
}