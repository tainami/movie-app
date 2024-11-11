import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/theme/spacing.dart';
import 'package:movie_app/store/movie_state.dart';
import 'package:movie_app/widgets/movie_card.dart';

class MovieListContent extends StatelessWidget {
  final MovieState movieState;

  const MovieListContent({super.key, required this.movieState});

  @override
  Widget build(BuildContext context) {
    if (movieState is MovieStateLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (movieState is MovieStateError) {
      return Center(
        child: Text(
          (movieState as MovieStateError).message ?? 'Erro desconhecido',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      );
    } else if (movieState is MovieStateSuccess) {
      final movies = (movieState as MovieStateSuccess).movies;
      if (movies.isEmpty) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/empty.json',
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            const Text(
              "Nenhum filme encontrado",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        );
      } else {
        return GridView.builder(
          padding: const EdgeInsets.only(
            bottom: Spacing.xxm32 + kBottomNavigationBarHeight,
            top: Spacing.x16,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 16,
            childAspectRatio: 9 / 12,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return MovieCard.mini(
              url: movies[index].imageUrl,
              id: movies[index].id,
              useRightSpacing: false,
              useNavigation: true,
            );
          },
        );
      }
    } else {
      return Column(
        children: [
          Lottie.asset(
            'assets/empty.json',
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          const Text(
            "Digite para buscar filmes",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      );
    }
  }
}
