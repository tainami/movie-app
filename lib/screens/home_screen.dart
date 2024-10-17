import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:movie_app/widgets/gradient_background.dart';
import 'package:movie_app/widgets/movie_caroussel_item.dart';
import 'package:movie_app/widgets/notification_icon.dart';
import 'package:movie_app/widgets/user_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(),
          Column(
            children: [
              AppBar(
                toolbarHeight: 70,
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserAvatar(),
                    NotificationIcon(),
                  ],
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              FlutterCarousel.builder(
                options: FlutterCarouselOptions(
                  indicatorMargin: 0,
                  autoPlay: true,
                  height: MediaQuery.of(context).size.height * 0.4,
                  showIndicator: true,
                  slideIndicator: CircularSlideIndicator(
                    slideIndicatorOptions: const SlideIndicatorOptions(
                      indicatorRadius: 5,
                    ),
                  ),
                ),
                itemCount: 5,
                itemBuilder: (
                  BuildContext context,
                  int itemIndex,
                  int pageViewIndex,
                ) {
                  return const MovieCarousselItem(
                    url:
                        "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                    id: 0,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
