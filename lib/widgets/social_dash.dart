import 'package:flutter/material.dart';
import 'package:batu/controllers/sound_controller.dart';
import 'package:batu/widgets/tile.dart';
import 'package:batu/theme/theme.dart';
import 'package:provider/provider.dart';

class SocialPageWidget extends StatefulWidget {
  const SocialPageWidget({super.key});

  @override
  State<SocialPageWidget> createState() => _SocialPageWidgetState();
}

class _SocialPageWidgetState extends State<SocialPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SoundController>(
      builder: (context, soundController, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            // Base width for design (3 tiles at 300px each)
            const baseWidth = 900.0;
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
                        url: Uri.parse('https://steamcommunity.com/id/kozetsu'),
                        soundController: soundController,
                        child: Container(
                          margin: EdgeInsets.all(2.5 * scale),
                          color: tileColor,
                          width: 300 * scale,
                          height: 200 * scale,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Center(
                            child: Image(height: 100, image: AssetImage('assets/icons/steam.png')),
                          ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8 * scale, left: 16 * scale),
                              child: FittedBox(
                                child: Text(
                                  'Steam',
                                  style: itemLabelLight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    TileWidget(
                        url: Uri.parse('https://www.xbox.com/en-US/play/user/Baturhancan'),
                        soundController: soundController,
                        child: Container(
                          margin: EdgeInsets.all(2.5 * scale),
                          color: tileColor,
                          width: 300 * scale,
                          height: 200 * scale,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Center(
                              child: Image(height: 100, image: AssetImage('assets/icons/xbox.png')),
                            ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8 * scale, left: 16 * scale),
                                child: FittedBox(
                                  child: Text(
                                    'Xbox',
                                    style: itemLabelLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    TileWidget(
                        url: Uri.parse('https://discordapp.com/users/baturhancan'),
                        soundController: soundController,
                        child: Container(
                          margin: EdgeInsets.all(2.5 * scale),
                          color: tileColor,
                          width: 300 * scale,
                          height: 200 * scale,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Center(
                              child: Image(height: 100, image: AssetImage('assets/icons/discord.png')),
                            ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8 * scale, left: 16 * scale),
                                child: FittedBox(
                                  child: Text(
                                    'Discord',
                                    style: itemLabelLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
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
