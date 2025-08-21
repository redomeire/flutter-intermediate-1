import 'package:belajar_aplikasi_flutter_intermediate/shared/widgets/auth/auth_bottom_app_bar.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/login/widget/login_form.dart';
import 'package:belajar_aplikasi_flutter_intermediate/styles/typography/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            context.go("/onboarding");
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Welcome back! Glad to see you again!",
                    style: AppTextStyles.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AuthBottomAppBar(isLoginPage: true),
    );
  }
}
