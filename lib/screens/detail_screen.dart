import 'package:flutter/material.dart';
import 'package:wasteagram/models/waste_post.dart';
import 'package:intl/intl.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  static const routeName = 'post_details';

  @override
  Widget build(BuildContext context) {
    final WastePost post = ModalRoute.of(context)!.settings.arguments as WastePost;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wasteagram'),
        centerTitle: true,
      ),
      body: Column(  
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(DateFormat.yMMMEd().format(post.date).toString(),
              style: const TextStyle(fontSize: 20),), 
              ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .4,
            child: Image.network(
              post.imageURL,
              loadingBuilder: ((context, child, loadingProgress) {
                return loadingProgress == null ? child: const CircularProgressIndicator();
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Text(post.quantitiy.toString(),
              style: const TextStyle(fontSize: 30),),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text(  
              'Location: (${post.latitude.toString()}, ${post.longitude.toString()})'
            )
          )
        ],
      ),
    );
  }
}