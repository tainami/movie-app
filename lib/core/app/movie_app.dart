import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/movie_theme.dart';
import 'package:movie_app/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: MovieThemeData.secondary(),
      darkTheme: MovieThemeData.primary(),
      themeMode: ThemeMode.dark,
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/movies-details": (context) => const HomeScreen(),
      },
    );
  }
}
