// ignore_for_file: prefer_const_constructors

import 'package:business_ideas/config/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/main_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  DependencyInjection.setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  // ignore: library_private_types_in_public_api
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  Locale? _locale;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 24.0),
            bodyMedium: TextStyle(fontSize: 18.0),
            bodySmall: TextStyle(fontSize: 14.0),
            displayLarge: TextStyle(fontSize: 48.0),
            displayMedium: TextStyle(fontSize: 36.0),
            displaySmall: TextStyle(fontSize: 24.0),
            headlineLarge: TextStyle(fontSize: 24.0),
            headlineMedium: TextStyle(fontSize: 18.0),
            headlineSmall: TextStyle(fontSize: 14.0),
            titleLarge: TextStyle(fontSize: 24.0),
            titleMedium: TextStyle(fontSize: 18.0),
            titleSmall: TextStyle(fontSize: 14.0),
            labelLarge: TextStyle(fontSize: 24.0),
            labelMedium: TextStyle(fontSize: 18.0),
            labelSmall: TextStyle(fontSize: 14.0),
          ),
        ),
        darkTheme: ThemeData.dark(),
        themeMode: _themeMode,
        locale: _locale,
        home: MainPage(),
      ),
    );
  }

  void changeTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }
}
