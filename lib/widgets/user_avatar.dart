import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://st2.depositphotos.com/2703645/11099/v/950/depositphotos_110991568-stock-illustration-female-cartoon-avatar-icon.jpg",
            ),
          ),
        ),
        SizedBox(width: 15),
        SizedBox(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: TextStyle(
                  color: Color(0xFFAB947B),
                  fontSize: 16,
                ),
              ),
              Text(
                'Nome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
