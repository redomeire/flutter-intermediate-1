import 'package:belajar_aplikasi_flutter_intermediate/config/router/rules/redirect.dart';
import 'package:belajar_aplikasi_flutter_intermediate/config/router/widgets/app_bottom_navigation_bar.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/add-story-map/add_story_map_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/add-story/add_story_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/login/login_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/onboarding/onboarding_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/register/register_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/detail/detail_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/home/home_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/not-found/not-found.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../flavor/flavor_config.dart';
import '../theme/app_theme.dart';

class AppRouter extends StatefulWidget {
  final SharedPreferences sharedPreferences;

  const AppRouter({super.key, required this.sharedPreferences});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: FlavorConfig.instance.flavorValues.titleApp,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: widget.sharedPreferences.getString("App.Theme") == "dark"
          ? ThemeMode.dark
          : ThemeMode.light,
      routerConfig: _getRouterConfig(widget.sharedPreferences),
    );
  }

  GoRouter _getRouterConfig(SharedPreferences sharedPreferences) {
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
                  routes: [
                    GoRoute(
                      path: '/map',
                      builder: (context, state) => AddStoryMapScreen(),
                    ),
                  ],
                ),
                GoRoute(
                  path: "/settings",
                  builder: (context, state) => const SettingsScreen(),
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
}
