import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:movie_app/store/movie_store.dart';
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
              onPressed: onSearch,
              icon: const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: store,
          builder: (context, movieState, child) {
            return MovieListContent(movieState: movieState);
          },
        ),
      ),
    );
  }
}



// Column(
//         children: [
//           Lottie.asset(
//             'assets/empty.json',
//             height: context.percentHeight(0.25),
//           ),
//           Flexible(
//             child: GridView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: Spacing.x16),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 9 / 16,
//               ),
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return const MovieCard.mini(
//                   useRightSpacing: false,
//                   url:
//                       "https://i.pinimg.com/736x/d2/33/a4/d233a42eb8ab9c98d82bb019d230b354.jpg",
//                   id: 0,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
