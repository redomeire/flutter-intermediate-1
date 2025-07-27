import 'package:belajar_aplikasi_flutter_intermediate/providers/api/register_provider.dart';
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
                Form(
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
                                "Enter your name",
                                style: AppTextStyles.bodyLargeMedium,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
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
                                .isObscureText,
                            style: AppTextStyles.bodyLargeMedium,
                            decoration: InputDecoration(
                              hint: Text(
                                "Enter your password",
                                style: AppTextStyles.bodyLargeMedium,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _registerProvider.isObscureText =
                                      !_registerProvider.isObscureText;
                                },
                                icon: Icon(Icons.visibility_off_outlined),
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.visibility_off_outlined),
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
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                              ),
                              child: Text(
                                'Register',
                                style: AppTextStyles.bodyLargeMedium.copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
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
                              children: _buildSocialButtons(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
                      "Already have an account? ",
                      style: AppTextStyles.labelMedium.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go("/login");
                      },
                      child: Text(
                        "Login Now",
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
      ),
    );
  }
}

/// Builds social login buttons.
List<Widget> _buildSocialButtons() {
  return [
    _buildSocialButton(
      iconUrl:
          'https://th.bing.com/th/id/R.0fa3fe04edf6c0202970f2088edea9e7?rik=joOK76LOMJlBPw&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fgoogle-logo-png-open-2000.png&ehk=0PJJlqaIxYmJ9eOIp9mYVPA4KwkGo5Zob552JPltDMw%3d&risl=&pid=ImgRaw&r=0',
    ),
    const SizedBox(width: 10),
    _buildSocialButton(
      iconUrl:
          'https://th.bing.com/th/id/R.66dacd13d1a786cad40e9197159da06a?rik=BldOAxOEicVH%2bw&riu=http%3a%2f%2flogos-download.com%2fwp-content%2fuploads%2f2017%2f07%2fApple_logo_black.png&ehk=dOqdt5GR5Bk0d646HmWvFDgSaTN%2bi3hyx8GMv0B2Kd0%3d&risl=&pid=ImgRaw&r=0',
    ),
    const SizedBox(width: 10),
    _buildSocialButton(
      iconUrl:
          'https://cdn0.iconfinder.com/data/icons/social-messaging-ui-color-shapes-2-free/128/social-facebook-2019-square1-512.png',
      size: 23,
    ),
  ];
}

Widget _buildSocialButton({required String iconUrl, double size = 25}) {
  return TextButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      padding: const EdgeInsets.all(20),
      backgroundColor: Colors.white,
    ),
    child: Image.network(iconUrl, width: size, height: size),
  );
}
