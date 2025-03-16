import 'package:batu/controllers/sound_controller.dart';
import 'package:batu/theme/theme.dart';
import 'package:batu/widgets/media_dash.dart';
import 'package:batu/widgets/placeholder.dart';
import 'package:batu/widgets/social_dash.dart';

import 'package:flutter/material.dart';
import '../widgets/home_dash.dart';
import '../widgets/background_gradient.dart';
import '../widgets/user_row.dart';
import 'package:batu/models/navigation_item.dart';
import 'package:batu/widgets/navigation_menu.dart';
import 'package:provider/provider.dart';
import '../widgets/smooth_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool _isLoading = true;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late PageController _pageController;
  NavigationItem _selectedItem = NavigationItem.home;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutSine,
    ));
    _pageController = PageController(initialPage: NavigationItem.home.index);
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(milliseconds: 750));
    setState(() {
      _isLoading = false;
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onNavigationItemSelected(NavigationItem item) {
    setState(() {
      _selectedItem = item;
    });
    _pageController.animateToPage(
      item.index,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeOutCubic,
    );
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
                    const SizedBox(height: 32),
                    NavigationMenu(
                      selectedItem: _selectedItem,
                      onItemSelected: _onNavigationItemSelected,
                      soundController: Provider.of<SoundController>(context, listen: false),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.white.withAlpha(0),
                                    Colors.white,
                                    Colors.white,
                                    Colors.white.withAlpha(0),
                                  ],
                                  stops: const [0.0, 0.02, 0.98, 1.0],
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.dstIn,
                              child: SmoothPageView(
                                controller: _pageController,
                                physics: false,
                                children: const [
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: DashboardHomeWidget(),
                                  ), // home
                                  SocialPageWidget(), // games
                                  MediaDashWidget(), // tv movies
                                  PlaceholderWidget(), // music
                                  PlaceholderWidget() // apps
                                  // about
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
