import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff4d4d4f), Colors.white])),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.white, Color(0xffcdcdcf)])),
          ),
        )
      ],
    );
  }
}
