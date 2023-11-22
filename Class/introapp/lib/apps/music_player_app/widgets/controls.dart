import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Controls extends StatelessWidget {
  const Controls({super.key, required this.audioPlayer});

  final AudioPlayer audioPlayer;

  Widget buildPlayPauseButtons() {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final proccessingState = playerState?.processingState;
        final playing = playerState?.playing;

        if (!(playing ?? false)) {
          return IconButton(
            onPressed: audioPlayer.play,
            iconSize: 80,
            color: Colors.white,
            icon: const Icon(Icons.play_arrow_rounded),
          );
        } else if (proccessingState != ProcessingState.completed) {
          return IconButton(
            onPressed: audioPlayer.pause,
            iconSize: 80,
            color: Colors.white,
            icon: const Icon(Icons.pause_rounded),
          );
        } else {
          return const Icon(
            Icons.play_arrow_rounded,
            size: 80,
            color: Colors.white,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: audioPlayer.seekToPrevious,
          iconSize: 60,
          icon: const Icon(
            Icons.skip_previous_rounded,
            color: Colors.white,
          ),
        ),
        buildPlayPauseButtons(),
        IconButton(
          onPressed: audioPlayer.seekToNext,
          iconSize: 60,
          icon: const Icon(
            Icons.skip_next_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
