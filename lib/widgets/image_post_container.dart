import 'dart:io';
import 'package:flutter/material.dart';

class ImagePostContainer extends StatelessWidget {
  const ImagePostContainer({super.key, required this.image});

  final File image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.height * .4,
      height: MediaQuery.of(context).size.height * .4,
      child: Semantics(
        image: true,
        label: 'Image of wasted items',
        child: Image.file(File(image.path)),
      ),
    );
  }
}