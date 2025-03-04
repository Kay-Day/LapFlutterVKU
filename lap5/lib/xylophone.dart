import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class XylophonePage extends StatelessWidget {
  final AudioPlayer player = AudioPlayer();

  void playSound(int soundNumber) {
    player.play(AssetSource('matketnoi$soundNumber.mp3'));
  }

  Expanded buildKey({required int soundNumber, required Color color}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () => playSound(soundNumber),
        child: const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(soundNumber: 1, color: Colors.red),
          buildKey(soundNumber: 2, color: Colors.orange),
          buildKey(soundNumber: 3, color: Colors.yellow),
          buildKey(soundNumber: 4, color: Colors.green),
          buildKey(soundNumber: 5, color: Colors.blue),
          buildKey(soundNumber: 6, color: Colors.indigo),
          buildKey(soundNumber: 7, color: Colors.purple),
        ],
      ),
    );
  }
}
