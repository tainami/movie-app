import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/extensions/media_query_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/screens/root_screen.dart';

class CustomBottomBart extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChange;

  const CustomBottomBart({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

  BorderRadiusGeometry get borderRadius => BorderRadius.circular(60);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight + 30,
      width: context.percentWidth(.5),
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 92, 90, 90).withOpacity(0.5),
            borderRadius: borderRadius,
          ),
          margin: const EdgeInsets.only(bottom: 20, left: 8, right: 8),
          padding: EdgeInsets.zero,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        onTabChange(0);

                        if (currentIndex == 0) {
                          RootScreenControllers.homeScrollController.animateTo(
                            0,
                            duration: kThemeAnimationDuration,
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      icon: _buildIcon(
                        currentIndex: currentIndex,
                        tabIndex: 0,
                        iconData: FontAwesomeIcons.houseChimney,
                        label: "Home",
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                    IconButton(
                      onPressed: () {
                        onTabChange(1);

                        if (currentIndex == 1) {
                          RootScreenControllers.searchScrollController
                              .animateTo(
                            0,
                            duration: kThemeAnimationDuration,
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      icon: _buildIcon(
                        currentIndex: currentIndex,
                        tabIndex: 1,
                        iconData: FontAwesomeIcons.magnifyingGlass,
                        label: "Search",
                      ),
                      padding: const EdgeInsets.all(0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon({
    required int currentIndex,
    required int tabIndex,
    required IconData iconData,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          iconData,
          size: 20,
          color:
              tabIndex == currentIndex ? AppColors.light : AppColors.lightPlus2,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.openSans(
            fontSize: 12,
            color: tabIndex == currentIndex
                ? AppColors.light
                : AppColors.lightPlus2,
          ),
        ),
      ],
    );
  }
}
