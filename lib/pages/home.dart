import 'package:batu/theme/texttheme.dart';
import 'package:flutter/material.dart';
import '../widgets/dashboard.dart';
import '../widgets/background_gradient.dart';
import '../widgets/user_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGradient(),
          if (!_isLoading)
            FadeTransition(
              opacity: _opacityAnimation,
              child: Padding(
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
            ),
          if (!_isLoading)
            Positioned(
              bottom: 48,
              left: 128,
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Row(
                  children: [
                    const Image(height: 32, image: AssetImage('assets/icons/buttonA.png')),
                    const SizedBox(width: 12),
                    Text(
                      'Select',
                      style: buttonPressLabel,
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
