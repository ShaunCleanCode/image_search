import 'package:flutter/material.dart';
import 'package:image_search_app/model/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;
  const PhotoWidget({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(photo.previewURL))));
  }
}
