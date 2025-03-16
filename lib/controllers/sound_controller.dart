import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

class SoundController extends ChangeNotifier {
  AudioPlayer? _hoverPlayer;
  AudioPlayer? _clickPlayer;

  bool get isInitialized => _hoverPlayer != null && _clickPlayer != null;

  Future<void> initialize() async {
    if (isInitialized) return;

    _hoverPlayer = AudioPlayer();
    _clickPlayer = AudioPlayer();

    await Future.wait([
      _hoverPlayer!.setSource(AssetSource('sounds/hover.wav')),
      _clickPlayer!.setSource(AssetSource('sounds/click.wav')),
    ]);
    await Future.wait([
      _hoverPlayer!.setVolume(0.05),
      _clickPlayer!.setVolume(0.05),
    ]);
    if (kDebugMode) {
      print('Sounds initialized.');
    }
  }

  void updateController(SoundController newController) {
    _hoverPlayer = newController._hoverPlayer;
    _clickPlayer = newController._clickPlayer;
    notifyListeners();
  }

  Future<void> playHoverSound() async {
    if (!isInitialized) return;
    await _hoverPlayer!.resume();
  }

  Future<void> playClickSound() async {
    if (!isInitialized) return;
    await _clickPlayer!.resume();
  }

  @override
  void dispose() {
    _hoverPlayer?.dispose();
    _clickPlayer?.dispose();
    super.dispose();
  }
}
