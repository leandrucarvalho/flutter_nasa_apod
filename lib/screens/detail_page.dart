import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
  final apodStore = GetIt.I<ApodStore>();

  @override
  void initState() {
    super.initState();
    buildMediaWidget(widget.mediaType, widget.url);
  }

  @override
  void dispose() {
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
                  return snapshot.data ??
                      const Text("Não foi possível carregar o vídeo");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Expanded(
              child: Text(
                widget.subtitle,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
