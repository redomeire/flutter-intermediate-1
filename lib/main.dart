import 'package:belajar_aplikasi_flutter_intermediate/config/router/app_router.dart';
import 'package:belajar_aplikasi_flutter_intermediate/config/theme/app_theme.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/api/add_story_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/api/get_stories_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/api/get_story_detail_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/api/login_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/api/register_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/providers/shared_preferences_provider.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/http/api_service.dart';
import 'package:belajar_aplikasi_flutter_intermediate/services/local/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => SharedPreferencesService(sharedPreferences),
        ),
        ChangeNotifierProvider(
          create: (context) => SharedPreferencesProvider(
            sharedPreferencesService: SharedPreferencesService(
              sharedPreferences,
            ),
          ),
        ),
        Provider(
          create: (context) =>
              ApiService(baseUrl: 'https://story-api.dicoding.dev/v1'),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              LoginProvider(apiService: context.read<ApiService>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              RegisterProvider(apiService: context.read<ApiService>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              GetStoriesProvider(apiService: context.read<ApiService>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              GetStoryDetailProvider(apiService: context.read<ApiService>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              AddStoryProvider(apiService: context.read<ApiService>()),
        ),
      ],
      child: MaterialApp.router(
        title: "Story App",
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        routerConfig: router,
      ),
    );
  }
}
