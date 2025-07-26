import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/login/login_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/register/register_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/detail/detail_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/home/home_screen.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/not-found/not-found.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      routes: [
        GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
        GoRoute(
          path: '/register',
          builder: (context, state) => RegisterScreen(),
        ),
      ],
      builder: (context, state, child) {
        return Scaffold(body: child);
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
      ],
      builder: (context, state, child) {
        final path = state.uri.path;

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: path == '/' ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    context.go("/");
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.person,
                    color: path == '/profile' ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () => context.go('/profile'),
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
    final authPath = ["/login", "/register"];
    final privatePath = ["/", "/detail"];

    if (!isLoggedIn) {
      if (privatePath.contains(state.uri.path)) {
        return "/login";
      }
      return state.uri.path;
    }

    if (authPath.contains(state.uri.path)) {
      return "/";
    }

    return null;
  },
);
