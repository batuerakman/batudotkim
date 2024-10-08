import 'package:batu/theme/texttheme.dart';
import 'package:flutter/material.dart';
import '../widgets/dashboard.dart';
import '../widgets/background_gradient.dart';
import '../widgets/user_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGradient(),
          Padding(
            padding: const EdgeInsets.all(48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const UserRow(),
                const SizedBox(height: 64),
                Center(
                  child: SizedBox(
                    width: 1350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('bing', style: menuLabel),
                        Text('home', style: menuLabelSelected),
                        Text('social', style: menuLabel),
                        Text('games', style: menuLabel),
                        Text('tv & movies', style: menuLabel),
                        Text('music', style: menuLabel),
                        Text('apps', style: menuLabel),
                        Text('settings', style: menuLabel),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const DashboardWidget(),
              ],
            ),
          ),
          Positioned(
              bottom: 48,
              left: 128,
              child: Row(
                children: [
                  const Image(height: 32, image: AssetImage('assets/icons/buttonA.png')),
                  const SizedBox(width: 12),
                  Text(
                    'Select',
                    style: buttonPressLabel,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
