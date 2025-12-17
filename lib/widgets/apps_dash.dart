import 'package:flutter/material.dart';
import 'package:batu/controllers/sound_controller.dart';
import 'package:batu/widgets/tile.dart';
import 'package:batu/widgets/video_tile.dart';
import 'package:batu/theme/theme.dart';
import 'package:provider/provider.dart';

class AppsDashWidget extends StatefulWidget {
  const AppsDashWidget({super.key});

  @override
  State<AppsDashWidget> createState() => _AppsDashWidgetState();
}

class _AppsDashWidgetState extends State<AppsDashWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SoundController>(
      builder: (context, soundController, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            // Base width for design
            const baseWidth = 400.0;
            final scale = (constraints.maxWidth / baseWidth).clamp(0.3, 1.0);
            final isMobile = constraints.maxWidth < 900;

            return Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.only(top: 32 * scale),
                  child: Row(
                    mainAxisAlignment: isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
                    children: [
                      if (isMobile) SizedBox(width: 16 * scale),
                      TileWidget(
                        url: Uri.parse('https://tomodoro.study'),
                        soundController: soundController,
                        child: Container(
                          margin: EdgeInsets.all(2.5 * scale),
                          width: 400 * scale,
                          height: 300 * scale,
                      color: Colors.white,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                              const VideoTile(
                                videoPath: 'assets/projects/tomodoro.mp4',
                                fit: BoxFit.cover,
                              ),
                              Container(
                                height: 60 * scale,
                                width: double.infinity,
                                color: Colors.black.withAlpha(100),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16 * scale, bottom: 8 * scale),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Tomodoro',
                                      style: itemLabel,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      if (isMobile) SizedBox(width: 16 * scale),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
