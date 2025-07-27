import 'package:flutter/material.dart';

enum AppColor {
  green("Green", Colors.green),
  white("White", Colors.white),
  black("Black", Colors.black);

  const AppColor(this.name, this.color);

  final String name;
  final Color color;
}
