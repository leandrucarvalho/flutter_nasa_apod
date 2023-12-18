import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Future<Widget> buildMediaWidget(String mediaType, String mediaUrl) async {
  if (mediaType == 'video') {
    final VideoPlayerController videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(mediaUrl));

    await videoPlayerController.initialize();

    final ChewieController chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    return SizedBox(
      height: 500,
      width: 500,
      child: Chewie(
        controller: chewieController,
      ),
    );
  } else {
    return Image.network(mediaUrl, fit: BoxFit.cover);
  }
}
