import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/loading_image.dart';
import '../widgets/loaded_image.dart';



class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  static const routeName = 'new_post';

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {

  File? image;

  void getImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? ximage = await picker.pickImage(source: ImageSource.gallery);
    image = File(ximage!.path);
    setState(() {},);
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      getImage();
      return const LoadingImage();
    } else {
      return LoadedImage(image: image!);
    }
    
  }
}