import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ADD THIS
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Authentication/Signin.dart';
import 'Helper/Dependancies.dart' as dep;
import 'Routes/routes.dart';
import 'Themes/appcolors.dart';
import 'Widgets/SettingsWrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  // ⭐ GLOBAL STATUS BAR STYLE (applies to all pages)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,   // Transparent status bar
      statusBarIconBrightness: Brightness.light, // White icons
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(MyApp() );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  Color _appColor = const Color(0xFF065808);
  FlexScheme? _scheme;
  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }
  void changeAppColor(Color color, {FlexScheme? scheme}) {
    setState(() {
      _appColor = color;
      _scheme = scheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShuleOne Parents',
      theme: AppTheme.light(_appColor, scheme: _scheme),
      darkTheme: AppTheme.dark(_appColor, scheme: _scheme),
      themeMode: _themeMode,
      home: Signin(),
      initialRoute: RouteHelper.signin,
      routes: RouteHelper.getRoutes(),
      builder: (context, child) {
        return SettingsPageWrapper(
          themeMode: _themeMode,
          toggleTheme: toggleTheme,
          appColor: _appColor,
          changeAppColor: changeAppColor,
          child: child!, // ✅ child is never null here
        );
      },

    );
  }
}
