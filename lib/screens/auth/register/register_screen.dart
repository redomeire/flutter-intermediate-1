import 'package:belajar_aplikasi_flutter_intermediate/providers/api/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name = "";
  String email = "";
  String password = "";

  late RegisterProvider _registerProvider;
  @override
  void initState() {
    super.initState();
    _registerProvider = context.read<RegisterProvider>();
  }

  Future<void> handleRegister() async {
    await _registerProvider.register(name: name, email: email, password: password);
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
                      Text("This is register form"),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hint: Text("Enter your name"),
                          label: Text("Name"),
                        ),
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                      ),
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
                          password = val;
                        },
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: handleRegister,
                          child: Text('Submit'),
                        ),
                      ),
                      Text(context.watch<RegisterProvider>().message),
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
