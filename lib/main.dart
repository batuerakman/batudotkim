import 'package:batu/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:batu/controllers/sound_controller.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:batu/widgets/terms_page.dart';
import 'package:batu/widgets/privacy_page.dart';
import 'package:batu/widgets/support_page.dart';
import 'package:batu/widgets/background_gradient.dart';
import 'package:url_launcher/url_launcher.dart';

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
        '/privacy-policy': (context) => const _StandalonePage(pageType: 'privacy'),
        '/terms': (context) => const _StandalonePage(pageType: 'terms'),
        '/support': (context) => const _StandalonePage(pageType: 'support'),
        '/clowngame-pitchdeck': (context) => const _RedirectPage(url: 'https://www.canva.com/'), // Replace with actual Canva link
      },
    );
  }
}

/// Standalone page for /privacy-policy and /terms URLs.
/// Shows the policy content in a white panel over the gradient background.
class _StandalonePage extends StatelessWidget {
  final String pageType; // 'privacy', 'terms', 'support'
  const _StandalonePage({required this.pageType});

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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Slim green top bar
                        Container(
                          height: 6,
                          color: const Color(0xff009600),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 16 : 24,
                            vertical: isMobile ? 8 : 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.close, size: isMobile ? 22 : 28, color: Colors.grey.shade700),
                                onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
                                splashRadius: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
                    // Content
                    Expanded(
                      child: switch (pageType) {
                        'privacy' => const PrivacyContent(),
                        'support' => const SupportContent(),
                        _ => const TermsContent(),
                      },
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

/// Standalone page for external redirects
class _RedirectPage extends StatefulWidget {
  final String url;
  const _RedirectPage({required this.url});

  @override
  State<_RedirectPage> createState() => _RedirectPageState();
}

class _RedirectPageState extends State<_RedirectPage> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_self');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
