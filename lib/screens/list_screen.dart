import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/widgets/list_card.dart';
import 'new_post_screen.dart';


class ListScreen extends StatefulWidget {
  const ListScreen({super.key});
  static const routeName = '/';
  
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wasteagram'),
        centerTitle: true,),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Posts').orderBy('Date', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var post = snapshot.data!.docs[index];
              return ListCard(post: post);
            });
          } else {
            return const Center(child: CircularProgressIndicator());
          }        
        }),
        floatingActionButton: Semantics(
          enabled: true,
          onTapHint: 'Select an image',
          button: true,
          child: FloatingActionButton.large(
            child: const Text('New'),
            onPressed: () => Navigator.of(context).pushNamed(NewPostScreen.routeName),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}