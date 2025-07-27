import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/login/login_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/onboarding/onboarding_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/register/register_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/detail/detail_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/home/home_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/not-found/not-found.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../styles/typography/app_typography.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: '/onboarding',
          builder: (context, state) => OnboardingScreen(),
        ),
        GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
        GoRoute(
          path: '/register',
          builder: (context, state) => RegisterScreen(),
        ),
      ],
      builder: (context, state, child) {
        return child;
      },
    ),
    ShellRoute(
      routes: [
        GoRoute(path: '/', builder: (_, _) => HomeScreen()),
        GoRoute(
          path: '/story/:storyId',
          builder: (context, state) =>
              DetailScreen(storyId: state.pathParameters["storyId"]),
        ),
        GoRoute(path: '/test', builder: (_, _) => TestScreen()),
      ],
      builder: (context, state, child) {
        final path = state.uri.path;
        final sharedPreferencesService = context
            .read<SharedPreferencesProvider>();

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    // atau warna background jika ingin
                    child: InkWell(
                      onTap: () {
                        context.go("/");
                      },
                      child: SizedBox(
                        width: 60, // pastikan width = height untuk lingkaran
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              path == '/' ? Icons.home : Icons.home_outlined,
                              size: 24,
                              color: path == '/'
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                            ),
                            Text("home", style: AppTextStyles.labelSmall),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        context.go("/test");
                      },
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              path == '/test' ? Icons.home : Icons.home_outlined,
                              size: 24,
                              color: path == '/test'
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                            ),
                            Text("test", style: AppTextStyles.labelSmall),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    // atau warna background jika ingin
                    child: InkWell(
                      onTap: () async {
                        await sharedPreferencesService.deleteUserData();
                        Future.delayed(Duration(seconds: 1));
                        context.go("/");
                      },
                      child: SizedBox(
                        width: 60, // pastikan width = height untuk lingkaran
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.logout_outlined, size: 24),
                            Text("Logout", style: AppTextStyles.labelSmall),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  ],
  errorBuilder: (_, _) => NotFoundScreen(),
  redirect: (context, state) async {
    final sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
    await sharedPreferencesProvider.getUserData();

    final isLoggedIn = sharedPreferencesProvider.user != null;
    final authPath = ["/onboarding", "/login", "/register"];
    final privatePath = ["/", "/story/:storyId", "/test"];

    if (!isLoggedIn) {
      if (privatePath.contains(state.uri.path)) {
        return "/onboarding";
      }
      return state.uri.path;
    }

    if (authPath.contains(state.uri.path)) {
      return "/";
    }

    return null;
  },
);
