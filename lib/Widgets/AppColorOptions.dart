import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

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

final List<AppColorOption> appColorOptions = FlexScheme.values
    .map((scheme) {
  final schemeData = FlexColor.schemes[scheme];
  if (schemeData == null) return null; // skip if missing

  return AppColorOption(
    name: _prettyName(scheme.name),
    color: schemeData.light.primary,
    scheme: scheme,
  );
})
    .where((e) => e != null)
    .cast<AppColorOption>()
    .toList();


/// deepOrangeM3 → Deep Orange
String _prettyName(String value) {
  final buffer = StringBuffer();

  for (int i = 0; i < value.length; i++) {
    final char = value[i];
    if (i == 0) {
      buffer.write(char.toUpperCase());
    } else if (char.toUpperCase() == char &&
        char != char.toLowerCase()) {
      buffer.write(' ');
      buffer.write(char);
    } else {
      buffer.write(char);
    }
  }

  return buffer.toString().replaceAll('M3', '');
}
