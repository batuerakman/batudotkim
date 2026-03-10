import 'package:batu/controllers/sound_controller.dart';
import 'package:batu/theme/theme.dart';
import 'package:batu/widgets/about_dash.dart';
import 'package:batu/widgets/media_dash.dart';
import 'package:batu/widgets/social_dash.dart';
import 'package:batu/widgets/apps_dash.dart';
import 'package:batu/widgets/terms_page.dart';
import 'package:batu/widgets/privacy_page.dart';
import 'package:batu/widgets/unreal_engine_dash.dart';

import 'package:flutter/material.dart';
import '../widgets/home_dash.dart';
import '../widgets/home_dash_mobile.dart';
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

  Widget _buildDesktopLayout(BuildContext context, double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
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
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AppsDashWidget(),
                        ), // apps
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: MediaDashWidget(),
                        ), // media
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: UnrealEngineDashWidget(),
                        ), // unreal engine
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SocialPageWidget(),
                        ), // games
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AboutDashWidget(),
                        ), // about
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, double padding) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(padding),
          child: const UserRow(),
        ),
        const Expanded(
          child: DashboardHomeMobileWidget(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth < 600 ? 16.0 : (screenWidth < 1200 ? 32.0 : 48.0);
    final isMobile = screenWidth < 900;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGradient(),
          if (!_isLoading)
            FadeTransition(
              opacity: _opacityAnimation,
              child: isMobile ? _buildMobileLayout(context, padding) : _buildDesktopLayout(context, padding),
            ),
          if (!_isLoading && !isMobile)
            Positioned(
              bottom: padding,
              left: padding * 2,
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Row(
                  children: [
                    Image(height: 32 * (padding / 48), image: const AssetImage('assets/icons/buttonA.png')),
                    SizedBox(width: 12 * (padding / 48)),
                    Text(
                      'Select',
                      style: buttonPressLabel,
                    )
                  ],
                ),
              ),
            ),
          // Privacy & Terms links - bottom right (desktop only)
          if (!_isLoading && !isMobile)
            Positioned(
              bottom: padding,
              right: padding * 2,
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () => showPrivacyPopup(context),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey.shade600,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      child: Text(
                        'Privacy Policy',
                        style: itemLabelLight.copyWith(fontSize: 14, color: Colors.grey.shade600),
                      ),
                    ),
                    Text('|', style: itemLabelLight.copyWith(fontSize: 14, color: Colors.grey.shade400)),
                    TextButton(
                      onPressed: () => showTermsPopup(context),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey.shade600,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      child: Text(
                        'Terms of Service',
                        style: itemLabelLight.copyWith(fontSize: 14, color: Colors.grey.shade600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
