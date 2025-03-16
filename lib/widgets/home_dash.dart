import 'package:batu/theme/theme.dart';
import 'package:batu/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:batu/controllers/sound_controller.dart';
import 'package:provider/provider.dart';

class DashboardHomeWidget extends StatefulWidget {
  const DashboardHomeWidget({
    super.key,
  });

  @override
  State<DashboardHomeWidget> createState() => _DashboardHomeWidgetState();
}

class _DashboardHomeWidgetState extends State<DashboardHomeWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<SoundController>().initialize();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SoundController>(
      builder: (context, soundController, child) {
        return Center(
          child: Container(
            margin: const EdgeInsets.only(top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TileWidget(
                      soundController: soundController,
                      child: Container(
                        margin: const EdgeInsets.all(2.5),
                        width: 255,
                        height: 195,
                        color: tileColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Center(child: Image(height: 70, image: AssetImage('assets/icons/discIcon.png'))),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8, left: 16),
                              child: FittedBox(
                                child: Text(
                                  'Open Tray',
                                  style: itemLabelLight,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    TileWidget(
                      soundController: soundController,
                      child: Container(
                        margin: const EdgeInsets.all(2.5),
                        width: 255,
                        height: 195,
                        color: tileColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Center(
                                child: Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Image(height: 100, image: AssetImage('assets/icons/pinIcon.png')),
                            )),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8, left: 16),
                              child: Text(
                                'My Pins',
                                style: itemLabelLight,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    TileWidget(
                      soundController: soundController,
                      url: Uri(
                        scheme: 'mailto',
                        path: 'erakmanbatu@icloud.com',
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(2.5),
                        width: 255,
                        height: 195,
                        color: tileColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                                child: Padding(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Image(height: 80, image: AssetImage('assets/icons/mail.png')),
                            )),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8, left: 16),
                              child: Text(
                                'Contact',
                                style: itemLabelLight,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        TileWidget(
                          soundController: soundController,
                          url: Uri.parse('https://www.github.com/batuerakman'),
                          child: Container(
                            margin: const EdgeInsets.all(2.5),
                            width: 695,
                            height: 395,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                const Image(image: AssetImage('assets/home/githubBg.png')),
                                Container(
                                  height: 50,
                                  width: 695,
                                  color: Colors.black.withAlpha(50),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      'Github',
                                      style: itemLabel,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TileWidget(
                          soundController: soundController,
                          url: Uri.parse('https://open.spotify.com/user/q1jkwgclr65ptlalqtjqkus38'),
                          child: Container(
                            margin: const EdgeInsets.all(2.5),
                            width: 345,
                            height: 195,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                const Image(image: AssetImage('assets/home/spotifyBg.png')),
                                Container(
                                  height: 50,
                                  width: 695,
                                  color: Colors.black.withAlpha(50),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Text(
                                      'Spotify',
                                      style: itemLabel,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        TileWidget(
                          url: Uri.parse('https://www.youtube.com/watch?v=Yv6shy_9KVM'),
                          soundController: soundController,
                          child: Container(
                            margin: const EdgeInsets.all(2.5),
                            width: 345,
                            height: 195,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                const Image(
                                  image: AssetImage('assets/home/gokuNukuBg.png'),
                                  fit: BoxFit.cover,
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
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    TileWidget(
                      soundController: soundController,
                      url: Uri.parse('https://www.linkedin.com/in/batu-erakman-541934309/'),
                      child: Container(
                        margin: const EdgeInsets.all(2.5),
                        width: 260,
                        height: 195,
                        color: tileColor,
                        child: const Stack(
                          alignment: Alignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/icons/linkedin.png'),
                              height: 125,
                            ),
                          ],
                        ),
                      ),
                    ),
                    TileWidget(
                      soundController: soundController,
                      child: Container(
                        margin: const EdgeInsets.all(2.5),
                        width: 260,
                        height: 195,
                        color: Colors.white,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              height: 50,
                              width: double.infinity,
                              color: Colors.black.withAlpha(100),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  'soon',
                                  style: itemLabel,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    TileWidget(
                      soundController: soundController,
                      child: Container(
                        margin: const EdgeInsets.all(2.5),
                        width: 260,
                        height: 195,
                        color: Colors.white,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              height: 50,
                              width: double.infinity,
                              color: Colors.black.withAlpha(100),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  'soon',
                                  style: itemLabel,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
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
