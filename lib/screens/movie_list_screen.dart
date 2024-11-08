// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:movie_app/store/movie_state.dart';
import 'package:movie_app/store/movie_store.dart';
import 'package:movie_app/widgets/gradient_background.dart';
import 'package:movie_app/widgets/list_movie_grid.dart';

enum CategoryType {
  nowPlaying,
  topRated,
  popular,
}

class MovieListScreenArgs {
  final String title;
  final CategoryType type;

  MovieListScreenArgs({
    required this.title,
    required this.type,
  });
}

class MovieListScreen extends StatefulWidget {
  final MovieListScreenArgs? args;

  const MovieListScreen({
    super.key,
    this.args,
  });

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  late final MovieStore store;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    store = MovieStore(MovieRepositoryImpl(Dio()));
    scrollController = ScrollController();
    _fetchMoviesByCategory();

    store.addListener(storeListener);
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    store.removeListener(storeListener);
    store.dispose();
    super.dispose();
  }

  void storeListener() {
    if (store.value is MovieStateError) {
      showSnackMessage();
    }
  }

  void showSnackMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Erro ao carregar filmes'),
        duration: Duration(seconds: 4),
      ),
    );
  }

  Future<void> scrollListener() async {
    final canLoad = store.value is! MovieStateLoading &&
        store.value is! MovieStateError &&
        store.value is! MovieStateLoadingMore;
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 100) {
      if (canLoad) {
        await _fetchMoviesByCategory();
      }
    }
  }

  Future<void> _fetchMoviesByCategory() async {
    switch (widget.args?.type) {
      case CategoryType.popular:
        await store.getPopularMovies();
        break;
      case CategoryType.nowPlaying:
        await store.getNowPlayingMovies();
        break;
      case CategoryType.topRated:
        await store.getTopRatedMovies();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.args?.title ?? "Movie List",
          style: context.titleLarge.copyWith(
            color: AppColors.light,
          ),
        ),
        iconTheme: const IconThemeData(
          color: AppColors.light,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (context, state, child) {
          if (state is MovieStateLoading) {
            return const Stack(
              children: [
                GradientBackground(),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          } else if (state is MovieStateSuccess) {
            return ListMovieGrid(
              scrollController: scrollController,
              movies: state.movies,
            );
          } else if (state is MovieStateLoadingMore) {
            return ListMovieGrid(
              isLoading: true,
              scrollController: scrollController,
              movies: state.movies,
            );
          } else if (state is MovieStateError) {
            return ListMovieGrid(
              scrollController: scrollController,
              movies: state.movies ?? [],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
