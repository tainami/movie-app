import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:movie_app/core/extensions/media_query_extension.dart';
import 'package:movie_app/core/theme/spacing.dart';
import 'package:movie_app/screens/root_screen.dart';
import 'package:movie_app/widgets/gradient_background.dart';
import 'package:movie_app/widgets/movie_caroussel_item.dart';
import 'package:movie_app/widgets/movie_carrousel.dart';
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
          SingleChildScrollView(
            controller: RootScreenControllers.homeScrollController,
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      FlutterCarousel.builder(
                        options: FlutterCarouselOptions(
                          indicatorMargin: 0,
                          autoPlay: true,
                          height: context
                              .percentHeight(context.height > 700 ? 0.4 : 0.6),
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
                      const SizedBox(
                        height: Spacing.x16,
                      ),
                      const MovieCourossel.large(
                        imageUrls: [
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                        ],
                        title: "Recent",
                      ),
                      const SizedBox(
                        height: Spacing.x16,
                      ),
                      const MovieCourossel.large(
                        imageUrls: [
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                          "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                        ],
                        title: "My Favorites",
                      ),
                      const SizedBox(
                        height: Spacing.xxm32 + kBottomNavigationBarHeight,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
