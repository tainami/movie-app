import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/movie_theme.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/movie_list_screen.dart';
import 'package:movie_app/screens/root_screen.dart';
import 'package:movie_app/screens/search_screen.dart';
import 'package:movie_app/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: MovieThemeData.secondary(),
      darkTheme: MovieThemeData.primary(),
      themeMode: ThemeMode.dark,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
        "/": (context) => const RootScreen(),
        "/home": (context) => const HomeScreen(),
        "/search": (context) => const SearchScreen(),
        "/movie-list": (context) => MovieListScreen(
              args: ModalRoute.of(context)?.settings.arguments
                  as MovieListScreenArgs,
            )
      },
    );
  }
}
