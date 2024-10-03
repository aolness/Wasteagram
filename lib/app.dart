import 'package:flutter/material.dart';
import 'screens/list_screen.dart';
import 'screens/new_post_screen.dart';
import 'screens/detail_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final routes = {
    ListScreen.routeName: (context) => const ListScreen(),
    NewPostScreen.routeName: (context) => const NewPostScreen(),
    DetailScreen.routeName: (context) => const DetailScreen()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      title: 'Wasteagram',
      theme: ThemeData.dark(),
       
    );
  }
}