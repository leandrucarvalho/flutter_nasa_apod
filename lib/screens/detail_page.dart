import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:video_player/video_player.dart';

import '../stores/apod_store.dart';
import '../widgets/build_media_custom.dart';

class DatailPage extends StatefulWidget {
  final String mediaType;
  final String url;
  final String subtitle;

  const DatailPage({
    super.key,
    required this.url,
    required this.subtitle,
    required this.mediaType,
  });

  @override
  State<DatailPage> createState() => _DatailPageState();
}

class _DatailPageState extends State<DatailPage> {
  late ChewieController chewieController;
  late VideoPlayerController videoPlayerController;

  final apodStore = GetIt.I<ApodStore>();

  @override
  void initState() {
    super.initState();
    _initPlayer();
    buildMediaWidget(widget.mediaType, widget.url);
  }

  void _initPlayer() async {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url));
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
    );
  }

  @override
  void dispose() {
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FutureBuilder<Widget>(
              future: buildMediaWidget(widget.mediaType, widget.url),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return snapshot.data ?? Container();
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Text(
              widget.subtitle,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
