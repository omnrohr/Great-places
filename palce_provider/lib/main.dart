import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views/places_list_view.dart';
import './views/add_place_view.dart';
import './providers/great_places.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('building main');
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesListView(),
        routes: {
          AddPlaceView.routName: (context) => AddPlaceView(),
        },
      ),
    );
  }
}
