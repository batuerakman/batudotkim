import 'package:batu/theme/texttheme.dart';
import 'package:batu/widgets/tile.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      child: FittedBox(
        child: Row(
          children: [
            Column(
              children: [
                TileWidget(
                  child: Container(
                    margin: const EdgeInsets.all(2.5),
                    width: 255,
                    height: 195,
                    color: const Color(0xff009600),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Center(child: Image(height: 70, image: AssetImage('assets/icons/discIcon.png'))),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, left: 15),
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
                  child: Container(
                    margin: const EdgeInsets.all(2.5),
                    width: 255,
                    height: 195,
                    color: const Color(0xff009600),
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
                          padding: const EdgeInsets.only(left: 15),
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
                  url: Uri(
                    scheme: 'mailto',
                    path: 'erakmanbatu@icloud.com',
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(2.5),
                    width: 255,
                    height: 195,
                    color: const Color(0xff009600),
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
                          padding: const EdgeInsets.only(bottom: 5, left: 15),
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
                              color: Colors.black.withOpacity(0.4),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
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
                              color: Colors.black.withOpacity(0.4),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
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
                      child: Container(
                        margin: const EdgeInsets.all(2.5),
                        width: 345,
                        height: 195,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            const Image(image: AssetImage('assets/home/gokuNukuBg.png')),
                            Container(
                              height: 50,
                              width: 695,
                              color: Colors.black.withOpacity(0.4),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'soon',
                                  style: itemLabel,
                                ),
                              ),
                            )
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
                  child: Container(
                    margin: const EdgeInsets.all(2.5),
                    width: 260,
                    height: 195,
                    color: const Color(0xff747474),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.4),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
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
                  child: Container(
                    margin: const EdgeInsets.all(2.5),
                    width: 260,
                    height: 195,
                    color: const Color(0xff747474),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.4),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
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
                  child: Container(
                    margin: const EdgeInsets.all(2.5),
                    width: 260,
                    height: 195,
                    color: const Color(0xff747474),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.4),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
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
  }
}
