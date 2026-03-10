import 'package:batu/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:batu/controllers/sound_controller.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:batu/widgets/terms_page.dart';
import 'package:batu/widgets/privacy_page.dart';
import 'package:batu/widgets/background_gradient.dart';

void main() {
  usePathUrlStrategy();
  runApp(
    ChangeNotifierProvider(
      create: (context) => SoundController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'batu',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/privacy-policy': (context) => const _StandalonePolicyPage(isPrivacy: true),
        '/terms': (context) => const _StandalonePolicyPage(isPrivacy: false),
      },
    );
  }
}

/// Standalone page for /privacy-policy and /terms URLs.
/// Shows the policy content in a white panel over the gradient background.
class _StandalonePolicyPage extends StatelessWidget {
  final bool isPrivacy;
  const _StandalonePolicyPage({required this.isPrivacy});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final horizontalPad = isMobile ? 16.0 : 80.0;
    final verticalPad = isMobile ? 32.0 : 64.0;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGradient(),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPad,
                vertical: verticalPad,
              ),
              child: Material(
                color: Colors.white,
                elevation: 24,
                shadowColor: Colors.black.withAlpha(80),
                borderRadius: BorderRadius.circular(4),
                clipBehavior: Clip.antiAlias,
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
                          Image.asset(
                            'assets/icons/xbox.png',
                            height: isMobile ? 20 : 28,
                            color: const Color(0xff009600),
                            colorBlendMode: BlendMode.srcIn,
                          ),
                          IconButton(
                            icon: Icon(Icons.close, size: isMobile ? 22 : 28, color: Colors.grey.shade700),
                            onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
                            splashRadius: 20,
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
                    // Content
                    Expanded(
                      child: isPrivacy ? const PrivacyContent() : const TermsContent(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
