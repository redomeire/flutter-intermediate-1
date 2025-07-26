import 'package:belajar_aplikasi_flutter_intermediate/providers/api/login_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
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
  late LoginProvider _loginProvider;
  late SharedPreferencesProvider _sharedPreferencesProvider;

  Future<void> handleLogin() async {
    await _loginProvider.login(email: email, password: password);
    if (_loginProvider.user != null) {
      await _sharedPreferencesProvider.setUserData(_loginProvider.user!);
      context.go("/");
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
    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: Key("login_form"),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                minHeight: 100,
                maxWidth: 300,
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(20)),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text("This is login form"),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hint: Text("Enter your email"),
                          label: Text("Email"),
                        ),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hint: Text("Enter your password"),
                          label: Text("Password"),
                        ),
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: handleLogin,
                          child: Text('Tombol Full Width'),
                        ),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.go("/register");
                          },
                          child: Text('Register'),
                        ),
                      ),
                      Text(context.watch<LoginProvider>().message),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
