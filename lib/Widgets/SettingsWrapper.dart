import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class SettingsPageWrapper extends InheritedWidget {
  final ThemeMode themeMode;
  final void Function(bool isDarkMode) toggleTheme;
  final Color appColor;
  final void Function(Color color, {FlexScheme? scheme}) changeAppColor;

  const SettingsPageWrapper({
    super.key,
    required super.child,
    required this.themeMode,
    required this.toggleTheme,
    required this.appColor,
    required this.changeAppColor,
  });

  /// Easy access from context
  static SettingsPageWrapper of(BuildContext context) {
    final widget =
    context.dependOnInheritedWidgetOfExactType<SettingsPageWrapper>();
    if (widget == null) {
      throw FlutterError(
          'SettingsPageWrapper.of() called with a context that does not contain a SettingsPageWrapper.');
    }
    return widget;
  }

  @override
  bool updateShouldNotify(covariant SettingsPageWrapper oldWidget) {
    return appColor != oldWidget.appColor || themeMode != oldWidget.themeMode;
  }
}

/// 💡 Color + Scheme pairing
class AppColorOption {
  final String name;
  final Color color;
  final FlexScheme scheme;

  const AppColorOption({
    required this.name,
    required this.color,
    required this.scheme,
  });
}

/// ✅ Generate all color options from FlexScheme
final List<AppColorOption> appColorOptions = FlexScheme.values.map((scheme) {
  final schemeData = FlexColor.schemes[scheme]!;

  return AppColorOption(
    name: _prettyName(scheme.name),
    color: schemeData.light.primary,
    scheme: scheme,
  );
}).toList();

/// Convert deepOrangeM3 → Deep Orange
String _prettyName(String value) {
  final buffer = StringBuffer();
  for (int i = 0; i < value.length; i++) {
    final char = value[i];
    if (i == 0) {
      buffer.write(char.toUpperCase());
    } else if (char.toUpperCase() == char && char != char.toLowerCase()) {
      buffer.write(' ');
      buffer.write(char);
    } else {
      buffer.write(char);
    }
  }
  return buffer.toString().replaceAll('M3', '');
}
