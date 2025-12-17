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
                        child: Container(
                          margin: EdgeInsets.all(2.5 * scale),
                          color: tileColor,
                          width: 400 * scale,
                          height: 300 * scale,
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 8 * scale,
                                  top: 12 * scale,
                                  child: Text(
                                    'Project 1\ncoming soon',
                                    textAlign: TextAlign.center,
                                    style: itemLabelLight.copyWith(color: Colors.black.withAlpha(20)),
                                  ),
                                ),
                                Text(
                                  'Project 1\ncoming soon',
                                  textAlign: TextAlign.center,
                                  style: itemLabelLight,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TileWidget(
                        soundController: soundController,
                        child: Container(
                          margin: EdgeInsets.all(2.5 * scale),
                          color: tileColor,
                          width: 400 * scale,
                          height: 300 * scale,
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 8 * scale,
                                  top: 12 * scale,
                                  child: Text(
                                    'Project 2\ncoming soon',
                                    textAlign: TextAlign.center,
                                    style: itemLabelLight.copyWith(color: Colors.black.withAlpha(20)),
                                  ),
                                ),
                                Text(
                                  'Project 2\ncoming soon',
                                  textAlign: TextAlign.center,
                                  style: itemLabelLight,
                                ),
                              ],
                            ),
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
