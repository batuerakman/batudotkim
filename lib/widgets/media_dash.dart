import 'package:flutter/material.dart';
import 'package:batu/controllers/sound_controller.dart';
import 'package:batu/widgets/tile.dart';
import 'package:batu/theme/theme.dart';
import 'package:provider/provider.dart';

class MediaDashWidget extends StatefulWidget {
  const MediaDashWidget({super.key});

  @override
  State<MediaDashWidget> createState() => _MediaDashWidgetState();
}

class _MediaDashWidgetState extends State<MediaDashWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SoundController>(
      builder: (context, soundController, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            // Base width for design (400 + 255 + 255 = 910)
            const baseWidth = 910.0;
            final scale = (constraints.maxWidth / baseWidth).clamp(0.3, 1.0);
            final isMobile = constraints.maxWidth < 900;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(top: 32 * scale),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
                  children: [
                    if (isMobile) SizedBox(width: 16 * scale),
                    TileWidget(
                      soundController: soundController,
                      url: Uri.parse('https://letterboxd.com/batuerakm/'),
                      child: Container(
                        margin: EdgeInsets.all(2.5 * scale),
                        width: 400 * scale,
                        height: 400 * scale,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const Positioned.fill(
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/icons/backtothefuture.png'),
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            color: Colors.black.withAlpha(100),
                          ),
                        ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 16 * scale, bottom: 16 * scale),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Latest Watched',
                                      style: itemLabel,
                                    ),
                                    Text(
                                      'Back to the Future (1985)',
                                      style: itemLabelLight.copyWith(color: Colors.white.withAlpha(128)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        TileWidget(
                          soundController: soundController,
                          url: Uri.parse('https://myanimelist.net/profile/malbatu'),
                          child: Container(
                            margin: EdgeInsets.all(2.5 * scale),
                            width: 255 * scale,
                            height: 195 * scale,
                            color: tileColor,
                            child: const Center(
                              child: Image(
                                height: 100,
                                width: 170,
                                image: AssetImage('assets/icons/mal.png'),
                              ),
                            ),
                          ),
                        ),

                        // Letterboxd tile
                        TileWidget(
                          soundController: soundController,
                          url: Uri.parse('https://letterboxd.com/batuerakm/'),
                          child: Container(
                            margin: EdgeInsets.all(2.5 * scale),
                            width: 255 * scale,
                            height: 195 * scale,
                            color: tileColor,
                            child: const Center(
                              child: Image(
                                height: 100,
                                width: 160,
                                image: AssetImage('assets/icons/letterboxd.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (isMobile) SizedBox(width: 16 * scale),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
