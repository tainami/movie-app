import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/list_credits_model.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:movie_app/store/movie_state.dart';
import 'package:movie_app/store/movie_store.dart';
import 'package:movie_app/widgets/movie_card.dart';

class CastListBuilder extends StatefulWidget {
  final int movieId;

  const CastListBuilder({
    super.key,
    required this.movieId,
  });

  @override
  State<CastListBuilder> createState() => _CastListBuilderState();
}

class _CastListBuilderState extends State<CastListBuilder> {
  late final MovieStore store;
  @override
  void initState() {
    super.initState();
    store = MovieStore(MovieRepositoryImpl(Dio()));
    store.fetchMovieCast(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: store,
      builder: (context, movieCastState, child) {
        if (movieCastState is MovieStateLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: LinearProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
        if (movieCastState is MovieCastStateSuccess) {
          final List<ListCreditsModel> cast = movieCastState.movieCast;
          return SizedBox(
            height: 100,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 0.90,
              ),
              itemCount: cast.length,
              itemBuilder: (context, index) {
                final castMember = cast[index];
                return MovieCard.mini(
                  url: castMember.imageUrl,
                  id: widget.movieId,
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
