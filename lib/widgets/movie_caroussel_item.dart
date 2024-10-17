import 'package:flutter/material.dart';

class MovieCarousselItem extends StatelessWidget {
  final String url;
  final int id;

  const MovieCarousselItem({
    super.key,
    required this.url,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.fitWidth,
              )),
          child: Center(
            child: Material(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16),
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.play_circle,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Nome do filme",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        )
      ],
    );
  }
}
