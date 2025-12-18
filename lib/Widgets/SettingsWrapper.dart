import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPageWrapper extends InheritedWidget {
  final void Function(bool) toggleTheme;
  final ThemeMode themeMode;

  const SettingsPageWrapper({
    super.key,
    required this.toggleTheme,
    required this.themeMode,
    required super.child,
  });

  static SettingsPageWrapper? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SettingsPageWrapper>();

  @override
  bool updateShouldNotify(covariant SettingsPageWrapper oldWidget) =>
      themeMode != oldWidget.themeMode;
}
