import 'package:belajar_aplikasi_flutter_intermediate/providers/api/login_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/login/widget/login_button_builder.dart';
import 'package:belajar_aplikasi_flutter_intermediate/shared/widgets/auth/social_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../styles/typography/app_typography.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late LoginProvider _loginProvider;
  late SharedPreferencesProvider _sharedPreferencesProvider;

  Future<void> handleLogin() async {
    await _loginProvider.login(
      email: _loginProvider.email,
      password: _loginProvider.password,
    );
    if (_loginProvider.user != null) {
      await _sharedPreferencesProvider.setUserData(_loginProvider.user!);

      if (context.mounted) {
        context.go("/");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loginProvider = context.read<LoginProvider>();
    _sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Key("login_form"),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 10),
              TextField(
                style: AppTextStyles.bodyLargeMedium,
                decoration: InputDecoration(
                  hint: Text(
                    "Enter your email",
                    style: AppTextStyles.bodyLargeMedium,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5,
                    ), // border saat focus
                  ),
                ),
                onChanged: (val) {
                  _loginProvider.email = val;
                },
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: context.watch<LoginProvider>().isObscureText,
                style: AppTextStyles.bodyLargeMedium,
                decoration: InputDecoration(
                  hint: Text(
                    "Enter your password",
                    style: AppTextStyles.bodyLargeMedium,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: IconButton(
                    onPressed: _loginProvider.toggleObscureText,
                    icon: Icon(
                      context.watch<LoginProvider>().isObscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5,
                    ), // border saat focus
                  ),
                ),
                onChanged: (val) {
                  _loginProvider.password = val;
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Forgot password?"),
                ),
              ),
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: Consumer<LoginProvider>(
                  builder: (context, state, child) {
                    return LoginConsumerBuilder(
                      handleLogin: handleLogin,
                    ).loginButtonBuilder(context, state, widget);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Or login with",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyLargeRegular,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildSocialButtons(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
