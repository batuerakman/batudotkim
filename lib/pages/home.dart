import 'package:batu/hovereffect.dart';
import 'package:batu/hovereffectclickable.dart';
import 'package:batu/theme/texttheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGradient(),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 250, right: 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('bing', style: menuLabel),
                      const Text('home', style: menuLabelSelected),
                      Text('social', style: menuLabel),
                      Text('games', style: menuLabel),
                      Text('tv & movies', style: menuLabel),
                      Text('music', style: menuLabel),
                      Text('apps', style: menuLabel),
                      Text('settings', style: menuLabel),
                    ],
                  ),
                ),
                FlutterCarousel(
                    options:
                        CarouselOptions(showIndicator: false, height: 700, physics: RangeMaintainingScrollPhysics()),
                    items: [DashboardWidget(), DashboardWidget()])
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          Column(
            children: [
              HoverEffectWidget(
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
                        child: Text(
                          'Open Tray',
                          style: itemLabelLight,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              HoverEffectWidget(
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
                        padding: const EdgeInsets.only(bottom: 5, left: 15),
                        child: Text(
                          'My Pins',
                          style: itemLabelLight,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              HoverEffectWidget(
                child: Container(
                  margin: const EdgeInsets.all(2.5),
                  width: 255,
                  height: 195,
                  color: const Color(0xff009600),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
              LinkedHoverEffectWidget(
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
              Row(
                children: [
                  HoverEffectWidget(
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
                  HoverEffectWidget(
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
                                'Samui',
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
              HoverEffectWidget(
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
              HoverEffectWidget(
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
              HoverEffectWidget(
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
    );
  }
}

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff4d4d4f), Colors.white])),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Color(0xffcdcdcf)])),
          ),
        )
      ],
    );
  }
}
