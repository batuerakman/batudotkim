import 'package:batu/theme/theme.dart';
import 'package:batu/widgets/tile.dart';
import 'package:batu/widgets/video_tile.dart';
import 'package:flutter/material.dart';
import 'package:batu/controllers/sound_controller.dart';
import 'package:provider/provider.dart';

class DashboardHomeMobileWidget extends StatefulWidget {
  const DashboardHomeMobileWidget({
    super.key,
  });

  @override
  State<DashboardHomeMobileWidget> createState() => _DashboardHomeMobileWidgetState();
}

class _DashboardHomeMobileWidgetState extends State<DashboardHomeMobileWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<SoundController>().initialize();
      }
    });
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF2E2E2E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'About Me',
                      style: itemLabel.copyWith(fontSize: 24, color: Colors.white),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white70),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Hi, I\'m Batu!',
                  style: itemLabelLight.copyWith(fontSize: 18, color: Colors.grey.shade300),
                ),
                const SizedBox(height: 12),
                Text(
                  'A game designer and developer. This portfolio is a tribute to the iconic Xbox 360 Metro UI that shaped my design sensibilities.\n\nPlease do check out the web version!',
                  style: itemLabelLight.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Built with Flutter',
                  style: itemLabelLight.copyWith(fontSize: 12, color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SoundController>(
      builder: (context, soundController, child) {
        final screenWidth = MediaQuery.of(context).size.width;
        const outerPadding = 20.0; // Horizontal padding outside tile area
        const tileSpacing = 10.0; // Spacing between tiles

        // Calculate tile sizes based on screen width with consistent spacing
        final availableWidth = screenWidth - (outerPadding * 2);

        // Top L-shape tiles (About, Mail, Pins)
        final topSmallTileWidth = (availableWidth - tileSpacing) / 2;
        final topSmallTileHeight = topSmallTileWidth * 0.9; // More square

        // Bottom tiles (LinkedIn, Dribbble) - taller and more square
        final bottomTileWidth = (availableWidth - tileSpacing) / 2;
        final bottomTileHeight = bottomTileWidth * 1.0; // Square

        // Middle tiles
        final mediumTileWidth = (availableWidth - tileSpacing) / 2;
        final mediumTileHeight = mediumTileWidth * 0.75;
        final largeTileWidth = availableWidth;
        final largeTileHeight = largeTileWidth * 0.5;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: outerPadding, vertical: 16),
            child: Column(
              children: [
                // Top row: About (left) and Mail (right)
                Row(
                  children: [
                    // About
                    Expanded(
                      child: TileWidget(
                        soundController: soundController,
                        onTap: () => _showAboutDialog(context),
                        child: Container(
                          height: topSmallTileHeight,
                          color: tileColor,
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              const Center(child: Image(height: 64, image: AssetImage('assets/icons/discIcon.png'))),
                              const Spacer(),
                              Text(
                                'About',
                                style: itemLabelLight.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: tileSpacing),
                    // Mail
                    Expanded(
                      child: TileWidget(
                        soundController: soundController,
                        url: Uri(
                          scheme: 'mailto',
                          path: 'erakmanbatu@icloud.com',
                        ),
                        child: Container(
                          height: topSmallTileHeight,
                          color: tileColor,
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              const Center(child: Image(height: 64, image: AssetImage('assets/icons/mail.png'))),
                              const Spacer(),
                              Text(
                                'Contact',
                                style: itemLabelLight.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: tileSpacing),

                // Large Portfolio tile
                TileWidget(
                  soundController: soundController,
                  url: Uri.parse('https://erakm.artstation.com'),
                  child: SizedBox(
                    width: largeTileWidth,
                    height: largeTileHeight,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const Positioned.fill(
                          child: Image(
                            image: AssetImage('home/artstation.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.black.withAlpha(50),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Portfolio',
                                style: itemLabel.copyWith(fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: tileSpacing),

                // Large GitHub tile
                TileWidget(
                  soundController: soundController,
                  url: Uri.parse('https://www.github.com/batuerakman'),
                  child: SizedBox(
                    width: largeTileWidth,
                    height: largeTileHeight,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const Positioned.fill(
                          child: Image(
                            image: AssetImage('assets/home/githubBg.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.black.withAlpha(50),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Github',
                                style: itemLabel.copyWith(fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: tileSpacing),

                // Medium tiles row (YouTube left, Tomodoro right)
                Row(
                  children: [
                    Expanded(
                      child: TileWidget(
                        url: Uri.parse('https://www.youtube.com/watch?v=Yv6shy_9KVM'),
                        soundController: soundController,
                        child: SizedBox(
                          height: mediumTileHeight,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              const Positioned.fill(
                                child: Image(
                                  image: AssetImage('assets/home/gokuNukuBg.png'),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                    radius: 2,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withAlpha(50),
                                    ],
                                    stops: const [0.3, 0.8],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: tileSpacing),
                    Expanded(
                      child: TileWidget(
                        soundController: soundController,
                        url: Uri.parse('https://tomodoro.study'),
                        child: SizedBox(
                          height: mediumTileHeight,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              const VideoTile(
                                videoPath: 'assets/projects/tomodoro.mp4',
                                fit: BoxFit.cover,
                              ),
                              Container(
                                height: 35,
                                width: double.infinity,
                                color: Colors.black.withAlpha(100),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Tomodoro is live!',
                                      style: itemLabel.copyWith(fontSize: 14),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: tileSpacing),

                // Bottom row: LinkedIn only
                TileWidget(
                  soundController: soundController,
                  url: Uri.parse('https://www.linkedin.com/in/batu-erakman-541934309/'),
                  child: Container(
                    height: bottomTileHeight,
                    color: tileColor,
                    child: const Center(
                      child: Image(
                        height: 50,
                        image: AssetImage('assets/icons/linkedin.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
