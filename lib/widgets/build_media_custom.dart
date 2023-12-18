import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Future<Widget> buildMediaWidget(String mediaType, String mediaUrl) async {
  if (mediaType == 'video') {
    log('mediaUrl: $mediaUrl');
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );

    return SizedBox(
      height: 500,
      width: 500,
      child: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        onReady: () {},
      ),
    );
  } else {
    return Image.network(
      mediaUrl,
      fit: BoxFit.cover,
      width: 300,
      height: 300,
    );
  }
}
