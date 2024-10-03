// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:wasteagram/models/waste_post.dart';


void main() {

  DateTime now = DateTime.now();
  
  test('Post created with fill method should be correct', () {
    WastePost post = WastePost.fill('ExampleURL', 5, 1.0, -1.0, now);
    expect(post.imageURL, 'ExampleURL');
    expect(post.quantitiy, 5);
    expect(post.date, now);
    expect(post.latitude, 1.0);
    expect(post.longitude, -1.0);
  });

  test('Post created without fill method should be correct', () {
    WastePost newPost = WastePost();
    newPost.date = now;
    newPost.imageURL = 'ExampleURL';
    newPost.quantitiy = 5;
    newPost.latitude = 1.0;
    newPost.longitude = -1.0;
    expect(newPost.imageURL, 'ExampleURL');
    expect(newPost.quantitiy, 5);
    expect(newPost.date, now);
    expect(newPost.latitude, 1.0);
    expect(newPost.longitude, -1.0);

  });
  
}
