import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:introapp/apps/music_player_app/screens/play_screen.dart';
import 'package:introapp/apps/music_player_app/screens/songs_screen.dart';
import 'package:introapp/apps/music_player_app/widgets/media_metadata.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:rxdart/rxdart.dart';

import '../models/position_data.dart';
import '../widgets/controls.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  final String musicFolder = "";

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late List<Widget> _screens;
  late AudioPlayer _audioPlayer;
  final _audioQuery = OnAudioQuery();

  bool _hasPermission = false;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  void initState() {
    super.initState();
    checkAndRequestPermissions();
    _audioPlayer = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    await _audioPlayer.setLoopMode(LoopMode.all);

    _screens = List.of([
      PlayScreen(
        children: [
          buildMediaMetadata(),
          buildProgressBar(),
          const SizedBox(height: 20),
          Controls(audioPlayer: _audioPlayer),
        ],
      ),
      const SongsScreen(),
    ]);

    final songs = await queryForSongs(
      widget.musicFolder,
      OrderType.ASC_OR_SMALLER,
      null,
    );
    await _audioPlayer.setAudioSource(songs);
  }

  Future<ConcatenatingAudioSource> queryForSongs(
    String? path,
    OrderType orderType,
    SongSortType? sortType,
  ) async {
    Future<List<SongModel>> songModels = _audioQuery.querySongs(
      path: path,
      uriType: UriType.EXTERNAL,
      orderType: orderType,
      sortType: sortType,
      ignoreCase: true,
    );
    return ConcatenatingAudioSource(
      children: await songModels.then(
        (songModels) {
          return songModels.map(
            (model) {
              return AudioSource.uri(
                Uri.parse(model.data),
                tag: MediaItem(
                  id: model.id.toString(),
                  title: model.title,
                  artist: model.artist,
                ),
              );
            },
          ).toList();
        },
      ),
    );
  }

  checkAndRequestPermissions({bool retry = false}) async {
    _hasPermission = await _audioQuery.checkAndRequest(
      retryRequest: retry,
    );

    _hasPermission ? setState(() {}) : null;
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Widget buildMediaMetadata() {
    return StreamBuilder<SequenceState?>(
      stream: _audioPlayer.sequenceStateStream,
      builder: (context, snapshot) {
        final state = snapshot.data;
        if (state?.sequence.isEmpty ?? true) {
          return const SizedBox();
        }
        final metadata = state!.currentSource!.tag as MediaItem;
        return MediaMetadata(
          id: metadata.id,
          title: metadata.title,
          artist: metadata.artist,
        );
      },
    );
  }

  Widget buildProgressBar() {
    return StreamBuilder<PositionData>(
      stream: _positionDataStream,
      builder: (context, snapshot) {
        final positionData = snapshot.data;
        return ProgressBar(
          barHeight: 8,
          baseBarColor: Colors.grey[600],
          bufferedBarColor: Colors.grey,
          progressBarColor: Colors.red,
          thumbColor: Colors.red,
          timeLabelTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          progress: positionData?.position ?? Duration.zero,
          buffered: positionData?.bufferedPosition ?? Duration.zero,
          total: positionData?.duration ?? Duration.zero,
          onSeek: _audioPlayer.seek,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepOrange.shade900.withAlpha(195),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music),
            label: "Songs",
          ),
        ],
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: 0,
      ),
      body: _screens[currentIndex],
    );
  }
}
