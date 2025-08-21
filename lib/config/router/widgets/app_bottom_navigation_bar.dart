import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final String path;
  final Widget child;

  const AppBottomNavigationBar({
    super.key,
    required this.path,
    required this.child,
  });

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  late SharedPreferencesProvider _sharedPreferencesProvider;

  @override
  void initState() {
    super.initState();
    _sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context.go("/");
                  },
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          widget.path == '/' ? Icons.home : Icons.home_outlined,
                          size: 24,
                          color: widget.path == '/'
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context.go("/add-story");
                  },
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 24,
                          color: widget.path == '/add-story'
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context.go("/settings");
                  },
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings_outlined,
                          size: 24,
                          color: widget.path == '/settings'
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _sharedPreferencesProvider.user != null
                ? ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          await _sharedPreferencesProvider.deleteUserData();
                          Future.delayed(Duration(seconds: 1));
                          if (context.mounted) {
                            context.go("/");
                          }
                        },
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.logout_outlined, size: 24)],
                          ),
                        ),
                      ),
                    ),
                  )
                : ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          await _sharedPreferencesProvider.deleteUserData();
                          Future.delayed(Duration(seconds: 1));
                          if (context.mounted) {
                            context.go("/onboarding/login");
                          }
                        },
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.login_outlined, size: 24)],
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
