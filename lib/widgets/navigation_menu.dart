import 'package:flutter/material.dart';
import 'package:batu/models/navigation_item.dart';
import 'package:batu/theme/theme.dart';
import 'package:batu/controllers/sound_controller.dart';

class NavigationMenu extends StatelessWidget {
  final NavigationItem selectedItem;
  final Function(NavigationItem) onItemSelected;
  final SoundController soundController;

  const NavigationMenu({
    super.key,
    required this.selectedItem,
    required this.onItemSelected,
    required this.soundController,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: NavigationItem.values.map((item) {
            final isSelected = item == selectedItem;
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  soundController.playClickSound();
                  onItemSelected(item);
                },
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 200),
                  tween: Tween<double>(
                    begin: 0,
                    end: isSelected ? 1.0 : 0.0,
                  ),
                  builder: (context, value, child) {
                    return Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          if (isSelected)
                            BoxShadow(
                              color: Colors.white.withAlpha((25.5 * value).toInt()),
                              blurRadius: 24,
                              spreadRadius: 0,
                            ),
                        ],
                      ),
                      child: Text(
                        item.label,
                        style: isSelected ? menuLabelSelected : menuLabel,
                      ),
                    );
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
