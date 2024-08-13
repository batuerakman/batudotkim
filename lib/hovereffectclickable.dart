import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkedHoverEffectWidget extends StatefulWidget {
  final Widget child;
  final Uri url; // URL to navigate to when tapped

  const LinkedHoverEffectWidget({super.key, required this.child, required this.url});

  @override
  LinkedHoverEffectWidgetState createState() => LinkedHoverEffectWidgetState();
}

class LinkedHoverEffectWidgetState extends State<LinkedHoverEffectWidget> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _bounceAnimation =
        Tween<double>(begin: 1, end: 0.9).chain(CurveTween(curve: Curves.fastEaseInToSlowEaseOut)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _onTapDown(),
      onTapUp: (_) => _onTapUp(),
      onTapCancel: _onTapCancel,
      onTap: () => {_launchUrl()},
      child: MouseRegion(
        onEnter: (_) => _setHover(true),
        onExit: (_) => _setHover(false),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _bounceAnimation.value,
              child: child,
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate,
                transform: Matrix4.identity()..scale(_isHovered ? 1.1 : 1.0),
                transformAlignment: Alignment.center,
                child: Material(
                  elevation: _isHovered ? 20 : 0,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                        child: widget.child,
                      ),
                      if (_isHovered)
                        Positioned.fill(
                          child: ShaderMask(
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.2),
                                  Colors.transparent,
                                ],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.lighten,
                            child: widget.child,
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
    );
  }

  void _setHover(bool hovering) {
    setState(() {
      _isHovered = hovering;
    });
  }

  void _onTapDown() {
    _controller.forward();
    setState(() {});
  }

  void _onTapUp() {
    _controller.reverse();
    setState(() {});
  }

  void _onTapCancel() {
    _controller.reverse();
    setState(() {});
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(widget.url)) {
      throw Exception('Could not launch ${widget.url}');
    }
  }
}
