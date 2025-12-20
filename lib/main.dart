import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ADD THIS
import 'Authentication/Signin.dart';
import 'Routes/routes.dart';
import 'Themes/appcolors.dart';
import 'Widgets/SettingsWrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ⭐ GLOBAL STATUS BAR STYLE (applies to all pages)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,   // Transparent status bar
      statusBarIconBrightness: Brightness.light, // White icons
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShuleOne Parents',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: Signin(),
      initialRoute: RouteHelper.signin,
      routes: RouteHelper.getRoutes(),
      builder: (context, child) {
        return SettingsPageWrapper(
          toggleTheme: toggleTheme,
          themeMode: _themeMode,
          child: child!,
        );
      },
    );
  }
}
