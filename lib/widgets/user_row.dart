import 'package:batu/theme/texttheme.dart';
import 'package:flutter/material.dart';

class UserRow extends StatelessWidget {
  const UserRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: SizedBox(
        width: 1300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Image(height: 30, image: AssetImage('assets/icons/person.png')),
            Text(
              '20',
              style: userRowLabel,
            ),
            const SizedBox(
              width: 32,
            ),
            const Image(height: 24, image: AssetImage('assets/icons/mail.png')),
            const SizedBox(
              width: 8,
            ),
            Text(
              '20',
              style: userRowLabel,
            ),
            const SizedBox(width: 32),
            Text(
              '2013',
              style: userRowLabel,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Image(height: 20, image: AssetImage('assets/icons/g.png')),
            ),
            const Image(height: 36, image: AssetImage('assets/bentoPenguinAvatar.png')),
          ],
        ),
      ),
    );
  }
}
