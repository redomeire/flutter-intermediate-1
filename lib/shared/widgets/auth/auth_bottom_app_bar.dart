import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../../styles/typography/app_typography.dart';

class AuthBottomAppBar extends StatelessWidget {
  final bool isLoginPage;

  const AuthBottomAppBar({super.key, required this.isLoginPage});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${isLoginPage ? "Don't" : "Already"}  have an account? ",
                    style: AppTextStyles.labelMedium.copyWith(
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go(
                        isLoginPage
                            ? "/onboarding/register"
                            : "/onboarding/login",
                      );
                    },
                    child: Text(
                      "${isLoginPage ? "Register" : "Login"} Now",
                      style: AppTextStyles.labelMedium.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
