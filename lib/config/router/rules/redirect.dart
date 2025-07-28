import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../providers/shared_preferences_provider.dart';

Future<String?> redirectRules(BuildContext context, GoRouterState state) async {
  final sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
  await sharedPreferencesProvider.getUserData();
  final path = state.uri.path;

  final isLoggedIn = sharedPreferencesProvider.user != null;
  final authPath = ["/onboarding", "/login", "/register"];
  final isAuthPath = authPath.contains(path);
  final isPrivate =
      path == "/" || path.startsWith("/story/") || path == "/test";

  if (!isLoggedIn) {
    if (isPrivate) return "/onboarding";
    return path;
  }

  if (isAuthPath) return "/";

  return null;
}
