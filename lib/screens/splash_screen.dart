import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/extensions/media_query_extension.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/widgets/gradient_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToHomeScreen();
  }

  Future<void> goToHomeScreen() async {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.pushReplacementNamed(context, "/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Center(
        child: Stack(
          children: [
            const GradientBackground(),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'assets/splash.json',
                    height: context.percentHeight(0.35),
                    width: context.percentHeight(0.35),
                  ),
                  Text(
                    "Movie App",
                    style: context.titleLarge.copyWith(
                      color: AppColors.light,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
