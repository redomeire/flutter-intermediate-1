import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/flavor/flavor_config.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));

  FlavorConfig(
    flavorType: FlavorType.premium,
    flavorValues: const FlavorValues(titleApp: "Premium App"),
  );

  runApp(MyApp(sharedPreferences: sharedPreferences));
}
