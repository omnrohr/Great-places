import 'package:flutter/material.dart';

import '../views/places_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
      ),
      home: PlacesListView(),
    );
  }
}
