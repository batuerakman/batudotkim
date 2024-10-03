import 'package:batu/theme/texttheme.dart';
import 'package:batu/widgets/dashboard.dart';
import 'package:flutter/material.dart';
import '../widgets/background_gradient.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGradient(),
          Padding(
            padding: const EdgeInsets.all(64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
          )
        ],
      ),
    );
  }
}
