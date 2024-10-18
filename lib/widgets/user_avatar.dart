import 'package:flutter/material.dart';
import 'package:movie_app/core/extensions/theme_extension.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://st2.depositphotos.com/2703645/11099/v/950/depositphotos_110991568-stock-illustration-female-cartoon-avatar-icon.jpg",
            ),
          ),
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello,',
                style: TextStyle(
                  color: Color(0xFFAB947B),
                  fontSize: 16,
                ),
              ),
              Text(
                'Nome',
                style: context.headlineSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
