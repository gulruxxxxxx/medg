import 'package:flutter/material.dart';

class AppFonts extends ThemeExtension<AppFonts> {
  final TextStyle fontSize20Weight700;
  final TextStyle fontSize20Weight500;
  final TextStyle fontSize28Weight600;
  final TextStyle fontSize18Weight600;
  final TextStyle fontSize18Weight500;
  final TextStyle fontSize18Weight400;
  final TextStyle fontSize16Weight600;
  final TextStyle fontSize16Weight500;
  final TextStyle fontSize16Weight400;
  final TextStyle fontSize14Weight700;
  final TextStyle fontSize14Weight600;
  final TextStyle fontSize14Weight400;
  final TextStyle fontSize12Weight600;
  final TextStyle fontSize13Weight600;
  final TextStyle fontSize20Weight600;
  final TextStyle fontSize12Weight500;
  final TextStyle fontSize12Weight400;

  AppFonts({
    required this.fontSize20Weight700,
    required this.fontSize20Weight500,
    required this.fontSize28Weight600,
    required this.fontSize18Weight600,
    required this.fontSize18Weight500,
    required this.fontSize18Weight400,
    required this.fontSize12Weight600,
    required this.fontSize13Weight600,
    required this.fontSize20Weight600,
    required this.fontSize16Weight600,
    required this.fontSize16Weight500,
    required this.fontSize16Weight400,
    required this.fontSize14Weight700,
    required this.fontSize14Weight600,
    required this.fontSize14Weight400,
    required this.fontSize12Weight500,
    required this.fontSize12Weight400,
  });

  @override
  ThemeExtension<AppFonts> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppFonts> lerp(
      covariant ThemeExtension<AppFonts>? other, double t) {
    throw UnimplementedError();
  }
}
