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
        return Center(
          child: Container(
            margin: const EdgeInsets.only(top: 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TileWidget(
                  soundController: soundController,
                  url: Uri.parse('https://letterboxd.com/batuerakm/'),
                  child: Container(
                    margin: const EdgeInsets.all(2.5),
                    width: 400,
                    height: 400,
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
                            padding: const EdgeInsets.only(left: 16, bottom: 16),
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
                        margin: const EdgeInsets.all(2.5),
                        width: 255,
                        height: 195,
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
                        margin: const EdgeInsets.all(2.5),
                        width: 255,
                        height: 195,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
