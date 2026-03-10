import 'package:batu/theme/theme.dart';
import 'package:flutter/material.dart';

class AboutDashWidget extends StatelessWidget {
  const AboutDashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Responsive sizing
      final isMobile = constraints.maxWidth < 600;
      final isTablet = constraints.maxWidth < 900 && !isMobile;

      final margin = isMobile ? 16.0 : (isTablet ? 32.0 : 48.0);
      final padding = isMobile ? 16.0 : (isTablet ? 24.0 : 32.0);
      final headerFontSize = isMobile ? 22.0 : 28.0;
      final titleFontSize = isMobile ? 20.0 : 24.0;

      return Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: isMobile ? constraints.maxWidth : 1000),
          margin: EdgeInsets.all(margin),
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: const Color(0xFF2E2E2E),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Xbox 360 inspired header
              Image.asset('assets/icons/xbox.png', height: isMobile ? 24 : 32),
              SizedBox(height: isMobile ? 16 : 32),
              // Message content with Xbox-style typography
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isMobile ? constraints.maxWidth : 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to my portfolio!',
                      style: itemLabelLight.copyWith(
                        fontSize: titleFontSize,
                        color: Colors.grey.shade400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: isMobile ? 12 : 16),
                    Text(
                      'This site is a loving tribute to the iconic Xbox 360 "Metro" UI. Thanks for visiting!',
                      style: itemLabelLight.copyWith(
                        height: 1.5,
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.white,
                      ),
                      // Allow text to wrap naturally without ellipsis or fixed maxLines
                    ),
                    SizedBox(height: isMobile ? 16 : 24),
                    Text(
                      'Coded with Flutter',
                      style: itemLabelLight.copyWith(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
