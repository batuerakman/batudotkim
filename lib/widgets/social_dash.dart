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
        return Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TileWidget(
                    url: Uri.parse('https://steamcommunity.com/id/kozetsu'),
                    soundController: soundController,
                    child: Container(
                      margin: const EdgeInsets.all(2.5),
                      color: tileColor,
                      width: 300,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Center(
                            child: Image(height: 100, image: AssetImage('assets/icons/steam.png')),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, left: 16),
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
                        margin: const EdgeInsets.all(2.5),
                        color: tileColor,
                        width: 300,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Center(
                              child: Image(height: 100, image: AssetImage('assets/icons/xbox.png')),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8, left: 16),
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
                        margin: const EdgeInsets.all(2.5),
                        color: tileColor,
                        width: 300,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Center(
                              child: Image(height: 100, image: AssetImage('assets/icons/discord.png')),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8, left: 16),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
