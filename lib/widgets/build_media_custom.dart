import 'package:flutter/material.dart';

Widget buildMediaWidget(String mediaType, String mediaUrl) {
  if (mediaType == 'video') {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.black,
      child: const Center(
        child: Icon(
          Icons.play_circle_outline,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  } else {
    return Image.network(mediaUrl, fit: BoxFit.cover);
  }
}
