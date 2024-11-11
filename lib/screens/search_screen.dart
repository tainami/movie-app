import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:movie_app/store/movie_store.dart';
import 'package:movie_app/widgets/gradient_background.dart';
import 'package:movie_app/widgets/movie_list_content.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController textController;
  late final MovieStore store;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    store = MovieStore(MovieRepositoryImpl(Dio()));
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void onSearch() {
    final query = textController.text;
    if (query.isNotEmpty) {
      store.searchMovies(query);
    }
  }

  void onClear() {
    textController.clear();
    store.resetState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: TextFormField(
            controller: textController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              hintText: "Buscar por filme",
              hintStyle: context.labelLarge,
              suffixIcon: IconButton(
                onPressed: onClear,
                icon: const FaIcon(
                  FontAwesomeIcons.xmark,
                  color: AppColors.primary,
                ),
              ),
            ),
            onFieldSubmitted: (_) => onSearch(),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          const GradientBackground(),
          Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 120,
                    left: 16,
                    right: 16,
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: store,
                    builder: (context, movieState, child) {
                      return MovieListContent(movieState: movieState);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
