import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePage extends StatelessWidget {
  final String videoId;

  const YoutubePage({Key key, this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: videoId,
        ),
      ),
    );
  }
}
