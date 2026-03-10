import 'package:flutter/material.dart';

/// Shows a Metro UI–style popup overlay.
///
/// The popup fades the background content out, then scales a white panel
/// from bottom-left to top-right. Text inside fades in with a slight delay.
/// Green Xbox logo on top-left, close button on top-right.
Future<T?> showMetroPopup<T>({
  required BuildContext context,
  required Widget child,
}) {
  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close',
    barrierColor: Colors.black.withAlpha(200),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) {
      return _MetroPopupPage(
        animation: animation,
        child: child,
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}

class _MetroPopupPage extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const _MetroPopupPage({
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final horizontalPad = isMobile ? 16.0 : 80.0;
    final verticalPad = isMobile ? 32.0 : 64.0;

    // Scale animation: bottom-left to full size
    final scaleAnimation = CurvedAnimation(
      parent: animation,
      curve: const Interval(0.0, 0.65, curve: Curves.easeOutCubic),
    );

    // Content fade-in: delayed after scale
    final contentFade = CurvedAnimation(
      parent: animation,
      curve: const Interval(0.45, 1.0, curve: Curves.easeIn),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPad,
              vertical: verticalPad,
            ),
            child: Transform(
              alignment: Alignment.bottomLeft,
              transform: Matrix4.diagonal3Values(
                scaleAnimation.value.clamp(0.0, 1.0),
                scaleAnimation.value.clamp(0.0, 1.0),
                1.0,
              ),
              child: Material(
                color: Colors.white,
                elevation: 24,
                shadowColor: Colors.black.withAlpha(80),
                borderRadius: BorderRadius.circular(4),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      // Header bar
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 16 : 24,
                          vertical: isMobile ? 12 : 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Green Xbox logo
                            Image.asset(
                              'assets/icons/xbox.png',
                              height: isMobile ? 20 : 28,
                              color: const Color(0xff009600),
                              colorBlendMode: BlendMode.srcIn,
                            ),
                            // Close button
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                size: isMobile ? 22 : 28,
                                color: Colors.grey.shade700,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                              splashRadius: 20,
                            ),
                          ],
                        ),
                      ),
                      // Divider
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey.shade200,
                      ),
                      // Scrollable content with fade-in
                      Expanded(
                        child: FadeTransition(
                          opacity: contentFade,
                          child: child,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
