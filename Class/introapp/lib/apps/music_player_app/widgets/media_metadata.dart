import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MediaMetadata extends StatelessWidget {
  const MediaMetadata({
    super.key,
    required this.id,
    required this.title,
    this.artist,
  });

  final String id;
  final String title;
  final String? artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CircleAvatar(
              radius: 150,
              child: QueryArtworkWidget(
                id: int.parse(id),
                type: ArtworkType.AUDIO,
                nullArtworkWidget: const Icon(Icons.music_note_outlined),
                artworkHeight: 300,
                artworkWidth: 300,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          artist!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
