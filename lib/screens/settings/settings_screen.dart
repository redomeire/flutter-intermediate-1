import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../config/flavor/flavor_config.dart';
import '../../providers/shared_preferences_provider.dart';
import '../../styles/typography/app_typography.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late SharedPreferencesProvider _sharedPreferencesProvider;

  @override
  void initState() {
    super.initState();
    _sharedPreferencesProvider = context.read<SharedPreferencesProvider>();

    Future.microtask(() {
      _sharedPreferencesProvider.getTheme();
    });
  }

  void _toggleTheme(bool value) async {
    await _sharedPreferencesProvider.setTheme(value ? "dark" : "light");
    if (mounted) {
      context.go("/settings");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Text(
                    "Settings",
                    style: AppTextStyles.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dark Mode",
                          style: AppTextStyles.titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Reduce light when night comes",
                          style: AppTextStyles.labelMedium,
                        ),
                      ],
                    ),
                    Switch(
                      key: Key("themeSwitch"),
                      value:
                          context.watch<SharedPreferencesProvider>().theme ==
                          "dark",
                      onChanged: (val) => _toggleTheme(val),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Account Type",
                          style: AppTextStyles.titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "See your account type",
                          style: AppTextStyles.labelMedium,
                        ),
                      ],
                    ),
                    Text(
                      FlavorConfig.instance.flavorType == FlavorType.premium
                          ? "premium"
                          : "regular",
                      style: AppTextStyles.labelLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
