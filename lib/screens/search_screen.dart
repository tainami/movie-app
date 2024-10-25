import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/extensions/media_query_extension.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/spacing.dart';
import 'package:movie_app/widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        backgroundColor: AppColors.dark,
        title: TextFormField(
          controller: textController,
          decoration: InputDecoration(
            hintText: "Buscar por filme",
            hintStyle: context.labelLarge,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Lottie.asset(
            'assets/empty.json',
            height: context.percentHeight(0.25),
          ),
          Flexible(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.x16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 9 / 16,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const MovieCard.mini(
                  useRightSpacing: false,
                  url:
                      "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
                  id: 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
