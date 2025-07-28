import 'package:belajar_aplikasi_flutter_intermediate/screens/auth/register/widget/register_button_builder.dart';
import 'package:belajar_aplikasi_flutter_intermediate/shared/widgets/auth/social_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../providers/api/register_provider.dart';
import '../../../../styles/typography/app_typography.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late RegisterProvider _registerProvider;

  Future<void> handleRegister() async {
    await _registerProvider.register(
      email: _registerProvider.email,
      password: _registerProvider.password,
      name: _registerProvider.name,
    );

    if (!_registerProvider.error) {
      context.go("/login");
    }
  }

  @override
  void initState() {
    super.initState();
    _registerProvider = context.read<RegisterProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Key("re_form"),
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
                    "Enter your name",
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
                  _registerProvider.name = val;
                },
              ),
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
                  _registerProvider.email = val;
                },
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: context
                    .watch<RegisterProvider>()
                    .isObscureTextPassword,
                style: AppTextStyles.bodyLargeMedium,
                decoration: InputDecoration(
                  hint: Text(
                    "Enter your password",
                    style: AppTextStyles.bodyLargeMedium,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: IconButton(
                    onPressed: _registerProvider.toggleIsObscurePassword,
                    icon: Icon(
                      context.watch<RegisterProvider>().isObscureTextPassword
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
                  _registerProvider.password = val;
                },
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: true,
                style: AppTextStyles.bodyLargeMedium,
                decoration: InputDecoration(
                  hint: Text(
                    "Confirm password",
                    style: AppTextStyles.bodyLargeMedium,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _registerProvider.toggleIsObscureConfirmPassword();
                    },
                    icon: Icon(
                      context
                              .watch<RegisterProvider>()
                              .isObscureTextConfirmPassword
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
                  _registerProvider.email = val;
                },
              ),
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: Consumer<RegisterProvider>(
                  builder: RegisterConsumerBuilder(
                    handleRegister: handleRegister,
                  ).registerButtonBuilder,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Or register with",
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
