import 'package:belajar_aplikasi_flutter_intermediate/providers/api/register_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/register/widget/register_form.dart';
import 'package:belajar_aplikasi_flutter_intermediate/shared/widgets/auth/auth_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../styles/typography/app_typography.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterProvider _registerProvider;

  @override
  void initState() {
    super.initState();
    _registerProvider = context.read<RegisterProvider>();
  }

  Future<void> handleRegister() async {
    await _registerProvider.register(
      name: _registerProvider.name,
      email: _registerProvider.email,
      password: _registerProvider.password,
    );
  }

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
                    "Hello! Register to get started",
                    style: AppTextStyles.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RegisterForm(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AuthBottomAppBar(isLoginPage: false),
    );
  }
}
