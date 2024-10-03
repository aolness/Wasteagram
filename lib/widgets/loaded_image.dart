import 'package:flutter/material.dart';
import 'dart:io';
import 'create_post_form.dart';
import 'package:wasteagram/widgets/image_post_container.dart';

class LoadedImage extends StatelessWidget {
  const LoadedImage({super.key, required this.image});

  final File image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: const Text('New Post'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(  
          children: [
            ImagePostContainer(image: image),
            CreatePostForm(image: image,)
          ],
        ),
      ),
    );
  }
}