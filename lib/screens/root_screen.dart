import 'package:flutter/material.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/search_screen.dart';
import 'package:movie_app/widgets/custom_botttom_bar.dart';

class RootScreenControllers {
  static ScrollController homeScrollController = ScrollController();
  static ScrollController searchScrollController = ScrollController();
}

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
                return CustomBottomBart(
                  currentIndex: index,
                  onTabChange: onTabChange,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
