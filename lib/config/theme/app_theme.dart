import 'package:belajar_aplikasi_flutter_intermediate/config/flavor/flavor_config.dart';
import 'package:flutter/material.dart';

import '../../styles/color/app_color.dart';
import '../../styles/typography/app_typography.dart';

class AppTheme {
  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      headlineSmall: AppTextStyles.headlineSmall,
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,
      bodyLarge: AppTextStyles.bodyLargeBold,
      bodyMedium: AppTextStyles.bodyLargeMedium,
      bodySmall: AppTextStyles.bodyLargeRegular,
      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium,
      labelSmall: AppTextStyles.labelSmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(toolbarTextStyle: _textTheme.titleLarge);
  }

  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: FlavorConfig.instance.flavorType == FlavorType.regular
          ? AppColor.white.color
          : AppColor.green.color,
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: FlavorConfig.instance.flavorType == FlavorType.regular
          ? AppColor.black.color
          : AppColor.green.color,
      brightness: Brightness.dark,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }
}
