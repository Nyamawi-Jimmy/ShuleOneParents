import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
abstract final class AppTheme {
  static ThemeData light(Color primary, {FlexScheme? scheme}) {
    return FlexThemeData.light(
      scheme: scheme,
      colors: scheme == null
          ? FlexSchemeColor.from(
        primary: primary,
        brightness: Brightness.light,
      )
          : null,
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        inputDecoratorIsFilled: true,
      ),
    );
  }

  static ThemeData dark(Color primary, {FlexScheme? scheme}) {
    return FlexThemeData.dark(
      scheme: scheme,
      colors: scheme == null
          ? FlexSchemeColor.from(
        primary: primary,
        brightness: Brightness.dark,
      )
          : null,
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        blendOnColors: true,
      ),
    );
  }
}
