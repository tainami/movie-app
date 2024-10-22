import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late final ValueNotifier<int> currentIndex;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    currentIndex = ValueNotifier(0);
    pageController = PageController();
    pageController.addListener(() {
      onPageViewChange(pageController.page ?? 0);
    });
  }

  void onPageViewChange(double index) {
    currentIndex.value = index.toInt();
  }

  void onTabChange(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: const [
              HomeScreen(),
              SearchScreen(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder(
                valueListenable: currentIndex,
                builder: (context, index, child) {
                  return PhysicalModel(
                    color: Colors.transparent,
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lowBlack.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: kBottomNavigationBarHeight + 36,
                      margin:
                          const EdgeInsets.only(bottom: 20, left: 8, right: 8),
                      child: Center(
                        child: BottomNavigationBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          currentIndex: index,
                          onTap: onTabChange,
                          type: BottomNavigationBarType.fixed,
                          items: const [
                            BottomNavigationBarItem(
                              icon: Icon(Icons.home),
                              label: "Home",
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.search),
                              label: "Search",
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
