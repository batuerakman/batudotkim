import 'package:batu/theme/theme.dart';
import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 3D skewed shadow
          Transform(
            transform: Matrix4.identity()
              ..rotateX(0.1)
              ..rotateZ(-0.05)
              ..translate(8.0, 12.0, -5.0),
            child: Text(
              'coming soon',
              style: itemLabelLight.copyWith(color: Colors.black.withAlpha(20)),
            ),
          ),
          // Main text
          Text('coming soon', style: itemLabelLight),
        ],
      ),
    );
  }
}
