import 'package:belajar_aplikasi_flutter_intermediate/providers/api/login_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/static/login_result_state.dart';
import 'package:belajar_aplikasi_flutter_intermediate/styles/typography/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool isObscureText = true;
  late LoginProvider _loginProvider;
  late SharedPreferencesProvider _sharedPreferencesProvider;

  Future<void> handleLogin() async {
    await _loginProvider.login(email: email, password: password);
    if (_loginProvider.user != null) {
      await _sharedPreferencesProvider.setUserData(_loginProvider.user!);
      Future.delayed(Duration(seconds: 1), () {
        context.go("/");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loginProvider = context.read<LoginProvider>();
    _sharedPreferencesProvider = context.read<SharedPreferencesProvider>();

    Future.microtask(() {
      _loginProvider.initResultState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  context.go("/onboarding");
                },
                icon: Icon(Icons.chevron_left, size: 24),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Welcome back! Glad \nto see you again",
                  overflow: TextOverflow.ellipsis,
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
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                        SizedBox(height: 15),
                        TextField(
                          obscureText: isObscureText,
                          style: AppTextStyles.bodyLargeMedium,
                          decoration: InputDecoration(
                            hint: Text(
                              "Enter your password",
                              style: AppTextStyles.bodyLargeMedium,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              icon: Icon(
                                isObscureText
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
                            setState(() {
                              password = val;
                            });
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
                              return switch (state.loginResultState) {
                                LoginResultLoading() => ElevatedButton(
                                  onPressed: null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    disabledBackgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 10,
                                    children: [
                                      SizedBox(
                                        width: 15.0,
                                        height: 15.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                          strokeWidth: 2.0,
                                        ),
                                      ),
                                      Text(
                                        'Login',
                                        style: AppTextStyles.bodyLargeMedium
                                            .copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.surface,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                LoginResultSuccess() => ElevatedButton(
                                  onPressed: handleLogin,
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
                                    'Login',
                                    style: AppTextStyles.bodyLargeMedium
                                        .copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.surface,
                                        ),
                                  ),
                                ),
                                LoginResultFailed() => Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ElevatedButton(
                                      onPressed: handleLogin,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black87,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
                                        ),
                                      ),
                                      child: Text(
                                        'Login',
                                        style: AppTextStyles.bodyLargeMedium
                                            .copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.surface,
                                            ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      state.message,
                                      style: AppTextStyles.bodyLargeMedium
                                          .copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.error,
                                          ),
                                    ),
                                  ],
                                ),
                                _ => ElevatedButton(
                                  onPressed: handleLogin,
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
                                    'Login',
                                    style: AppTextStyles.bodyLargeMedium
                                        .copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.surface,
                                        ),
                                  ),
                                ),
                              };
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
                      "Don't have an account? ",
                      style: AppTextStyles.labelMedium.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go("/register");
                      },
                      child: Text(
                        "Register Now",
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
