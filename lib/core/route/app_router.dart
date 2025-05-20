import 'package:go_router/go_router.dart';
import 'package:workwave/core/route/app_routes.dart';
import 'package:workwave/data/places_data.dart';
import 'package:workwave/ui/auth/login/login_screen.dart';
import 'package:workwave/ui/auth/registration/registration_screen.dart';
import 'package:workwave/ui/loading_screen/loading_screen.dart';
import 'package:workwave/ui/main_screens/chat/chat_screen.dart';
import 'package:workwave/ui/main_screens/home/home_screen.dart';
import 'package:workwave/ui/main_screens/main_screens.dart';
import 'package:workwave/ui/main_screens/map/map_screen.dart';
import 'package:workwave/ui/main_screens/profile/profile_screen.dart';
import 'package:workwave/ui/main_screens/vacancies/vacancies_screen.dart';
import 'package:workwave/ui/onboarding/onboarding_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder:(context, state) => OnboardingScreen(),
      ),

      GoRoute(
        path: AppRoutes.loading,
        builder:(context, state) => LoadingScreen(),
      ),


      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => LoginScreen(),
      ),

      GoRoute(
        path: AppRoutes.registration,
        builder:(context, state) => RegistrationScreen(),
      ),


      ShellRoute(
        builder:(context, state, child) {
          return MainScreens(
            path: state.fullPath,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder:(context, state) => HomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.vacancies,
            builder:(context, state) => VacanciesScreen(),
          ),
          GoRoute(
            path: AppRoutes.map,
            
            builder:(context, state) {
              final PlaceMarker? targetPlace = state.extra as PlaceMarker?;
              return  MapScreen(targetPlace: targetPlace,);
            }
          ),
          GoRoute(
            path: AppRoutes.chat,
            builder:(context, state) => ChatScreen(),
          ),
          GoRoute(
            path: AppRoutes.profile,
            builder:(context, state) => ProfileScreen(),
          ),
        ]
      )
    ]
  );
}