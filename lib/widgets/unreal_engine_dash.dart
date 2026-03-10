import 'package:flutter/material.dart';
import 'package:batu/controllers/sound_controller.dart';
import 'package:batu/widgets/tile.dart';
import 'package:batu/theme/theme.dart';
import 'package:provider/provider.dart';

class UnrealEngineDashWidget extends StatefulWidget {
  const UnrealEngineDashWidget({super.key});

  @override
  State<UnrealEngineDashWidget> createState() => _UnrealEngineDashWidgetState();
}

class _UnrealEngineDashWidgetState extends State<UnrealEngineDashWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SoundController>(
      builder: (context, soundController, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            // Base width for design (2 tiles at 400px each)
            const baseWidth = 800.0;
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
                        soundController: soundController,
                        url: Uri.parse('https://erakm.artstation.com/projects/ZlkQa0'),
                        child: Container(
                          margin: EdgeInsets.all(2.5 * scale),
                          width: 400 * scale,
                          height: 300 * scale,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              const Positioned.fill(
                                child: Image(
                                  image: AssetImage('assets/projects/vrship.png'),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              Container(
                                height: 48 * scale,
                                width: 400 * scale,
                                color: Colors.black.withAlpha(50),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16 * scale),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'VR Ship Simulation',
                                      style: itemLabel,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      TileWidget(
                        soundController: soundController,
                        url: Uri.parse('https://www.artstation.com/artwork/x3k93X'),
                        child: Container(
                          margin: EdgeInsets.all(2.5 * scale),
                          width: 400 * scale,
                          height: 300 * scale,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              const Positioned.fill(
                                child: Image(
                                  image: AssetImage('assets/projects/caesias.png'),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              Container(
                                height: 48 * scale,
                                width: 400 * scale,
                                color: Colors.black.withAlpha(50),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16 * scale),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Caesias',
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
