import 'package:flutter/material.dart';

class SmoothPageView extends StatefulWidget {
  final PageController controller;
  final List<Widget> children;
  final bool physics;

  const SmoothPageView({
    super.key,
    required this.controller,
    required this.children,
    this.physics = true,
  });

  @override
  State<SmoothPageView> createState() => _SmoothPageViewState();
}

class _SmoothPageViewState extends State<SmoothPageView> {
  late PageController _pageController;
  double _currentPage = 0;
  bool _isInitialLoad = true;

  @override
  void initState() {
    super.initState();
    _pageController = widget.controller;
    _pageController.addListener(_onPageChanged);

    // Set initial load to false after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isInitialLoad = false;
      });
    });
  }

  void _onPageChanged() {
    setState(() {
      _currentPage = _pageController.page ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: widget.physics ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        double difference = index - _currentPage;
        double absoluteDifference = difference.abs();
        double scale = _isInitialLoad ? 1.0 : 1 - (absoluteDifference * 0.1).clamp(0.0, 0.3);
        double opacity = 1 - (absoluteDifference * 0.5).clamp(0.0, 0.0);

        return Transform.scale(
          scale: scale,
          child: Opacity(
            opacity: opacity,
            child: widget.children[index],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    if (_pageController != widget.controller) {
      _pageController.dispose();
    }
    super.dispose();
  }
}
