import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/waste_post.dart';
import '../screens/detail_screen.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.post});

  final QueryDocumentSnapshot<Map<String, dynamic>> post;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blue,
      elevation: 10,
      child: ListTile(
        title: Text(getDate(post)),
        trailing: Text(post['Items'].toString()),
        onTap: () {
          final send = makeWaste(post);
          Navigator.of(context).pushNamed(DetailScreen.routeName, arguments: send);
    }));
  }

  String getDate(post){
    Timestamp time = post['Date'];
    DateTime date = time.toDate();
    return DateFormat.yMMMEd().format(date).toString();
  }

  WastePost makeWaste(post) {
    WastePost waste = WastePost();
    Timestamp stamp = post['Date'];
    waste.date = stamp.toDate();
    waste.quantitiy = post['Items'];
    waste.latitude = post['Lat'];
    waste.longitude = post['Long'];
    waste.imageURL = post['PhotoURL'];
    return waste;
  }
}