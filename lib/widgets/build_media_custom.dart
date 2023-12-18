import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Future<Widget> buildMediaWidget(String mediaType, String mediaUrl) async {
  if (mediaType == 'video') {
    String videoId = _getYoutubeVideoId(mediaUrl);

    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
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
          playedColor: Colors.blue,
          handleColor: Colors.blueAccent,
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

String _getYoutubeVideoId(String url) {
  RegExp regExp =
      RegExp(r'youtu(?:\.be|be\.com)/(?:.*v(?:/|=)|(?:.*/)?)([a-zA-Z0-9-_]+)');
  Match match = regExp.firstMatch(url)!;
  return match.group(1)!;
}
