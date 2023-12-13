import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../stores/apod_store.dart';

class DatailPage extends StatefulWidget {
  final String imageUrl;
  final String subtitle;
  const DatailPage({
    super.key,
    required this.imageUrl,
    required this.subtitle,
  });

  @override
  State<DatailPage> createState() => _DatailPageState();
}

class _DatailPageState extends State<DatailPage> {
  final apodStore = GetIt.I<ApodStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      body: Column(
        children: [
          Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              widget.subtitle,
              style: const TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
