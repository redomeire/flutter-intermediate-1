import 'package:belajar_aplikasi_flutter_intermediate/config/router/rules/redirect.dart';
import 'package:belajar_aplikasi_flutter_intermediate/config/router/widgets/app_bottom_navigation_bar.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/add-story/add_story_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/login/login_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/onboarding/onboarding_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/register/register_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/detail/detail_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/home/home_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/not-found/not-found.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

GoRouter getRouterConfig(SharedPreferences sharedPreferences) {
  final userData = sharedPreferences.getString("App.User");
  final router = GoRouter(
    initialLocation: userData != null ? "/" : "/onboarding",
    routes: [
      ShellRoute(
        routes: [
          GoRoute(
            path: '/onboarding',
            builder: (context, state) => OnboardingScreen(),
            routes: [
              GoRoute(
                path: '/login',
                builder: (context, state) => LoginScreen(),
              ),
              GoRoute(
                path: '/register',
                builder: (context, state) => RegisterScreen(),
              ),
            ],
          ),
        ],
        builder: (context, state, child) {
          return child;
        },
      ),
      ShellRoute(
        routes: [
          GoRoute(
            path: '/',
            builder: (_, _) => HomeScreen(),
            routes: [
              GoRoute(
                path: '/story/:storyId',
                builder: (context, state) =>
                    DetailScreen(storyId: state.pathParameters["storyId"]),
              ),
              GoRoute(
                path: '/add-story',
                builder: (context, state) => AddStoryScreen(),
              ),
            ],
          ),
        ],
        builder: (context, state, child) {
          final path = state.uri.path;
          return AppBottomNavigationBar(path: path, child: child);
        },
      ),
    ],
    errorBuilder: (_, _) => NotFoundScreen(),
    redirect: redirectRules,
  );

  return router;
}
