import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TileWidget extends StatefulWidget {
  final Widget child;
  final Uri? url;

  const TileWidget({
    super.key,
    required this.child,
    this.url,
  });

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  late Animation<double> _highlightAnimation;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _childKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.1),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    ));

    _elevationAnimation = Tween<double>(begin: 0, end: 16).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _highlightAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    _controller.dispose();
    super.dispose();
  }

  Widget _buildChildClone(Size size) {
    // get the original build context's DefaultTextStyle, otherwise overlaying breaks the style
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(_childKey.currentContext!);

    return DefaultTextStyle(
      style: defaultTextStyle.style,
      child: MediaQuery(
        data: MediaQuery.of(context),
        child: SizedBox.fromSize(
          size: size,
          child: widget.child,
        ),
      ),
    );
  }

  void _createOverlay(BuildContext context) {
    if (_overlayEntry != null) return;

    final RenderBox? renderBox = _childKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final Size size = renderBox.size;

    _overlayEntry = OverlayEntry(
      opaque: false,
      canSizeOverlay: false,
      builder: (context) => Positioned(
        width: size.width,
        height: size.height,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          child: MouseRegion(
            onEnter: (_) => _handleHoverChange(true),
            onExit: (_) => _handleHoverChange(false),
            child: GestureDetector(
              onTapDown: (_) => _controller.reverse(),
              onTapUp: (_) => _handleTap(),
              onTapCancel: () => _isHovered ? _controller.forward() : _controller.reverse(),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: _elevationAnimation.value * 0.5,
                          ),
                        ],
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          _buildChildClone(size),
                          Positioned.fill(
                            child: Padding(
                              padding: const EdgeInsets.all(2.5),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white.withOpacity(0.3 * _highlightAnimation.value),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _handleHoverChange(bool isHovered) {
    if (_isHovered == isHovered) return;

    setState(() => _isHovered = isHovered);

    if (isHovered) {
      _createOverlay(context);
      _controller.forward();
    } else {
      _controller.reverse().then((_) {
        if (!_isHovered) {
          _removeOverlay();
        }
      });
    }
  }

  Future<void> _handleTap() async {
    if (_controller.isAnimating) {
      _controller.stop();
    }

    await _controller.reverse();
    await _controller.forward();

    if (widget.url != null) {
      await launchUrl(widget.url!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) => _handleHoverChange(true),
        onExit: (_) => _handleHoverChange(false),
        child: GestureDetector(
          onTapDown: (_) => _controller.reverse(),
          onTapUp: (_) => _handleTap(),
          onTapCancel: () => _isHovered ? _controller.forward() : _controller.reverse(),
          child: KeyedSubtree(
            key: _childKey,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
