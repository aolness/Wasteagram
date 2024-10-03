import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'dart:io';

import 'package:wasteagram/models/waste_post.dart';

class CreatePostForm extends StatefulWidget {
  const CreatePostForm({super.key, required this.image});
  
  final File image;
  
  @override
  State<CreatePostForm> createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreatePostForm> {

  final formKey = GlobalKey<FormState>();

  LocationData? locationData;
  Location locationService = Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  WastePost post = WastePost();

  @override
  void initState() {
    super.initState();
    getlocation();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Semantics(
          selected: true,
          textField: true,
          hint:'Number of items wasted',
          child: Form(
            key: formKey,
            child: TextFormField(  
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Number of items wasted",
                border: OutlineInputBorder(),              
              ),
              validator: ((value) {
                if ( value!.isEmpty || int.parse(value) <= 0 ) {
                  return 'Please enter a number greater than 0';
                } else {
                  return null;
                  }
              }),
              onSaved: ((newValue) {
                post.quantitiy = int.parse(newValue!);
              }),
            ),
          ),
        ),
        Semantics(
          button: true,
          onTapHint: 'Saves the waste post',
          child: ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                post.date = DateTime.now();
                post.latitude = locationData!.latitude!;
                post.longitude = locationData!.longitude!;
                
                final storageRef = FirebaseStorage.instance.ref().child(DateTime.now().toString());
                await storageRef.putFile(widget.image);
                final url = await storageRef.getDownloadURL();
                post.imageURL = url;
        
                FirebaseFirestore.instance.collection('Posts').add({
                  'Date': post.date,
                  'Items': post.quantitiy,
                  'Lat': post.latitude,
                  'Long': post.longitude,
                  'PhotoURL': post.imageURL
                });
        
                Navigator.of(context).pop();
        
              }
            },
            child: const Text("Save")),
        )
      ],
    );
  }

  void getlocation() async {
    _serviceEnabled = await locationService.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await locationService.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }
    _permissionGranted = await locationService.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locationService.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await locationService.getLocation();
  }

  DateTime getDate() {
    var dt = DateTime.now();
    return dt;
  }

}