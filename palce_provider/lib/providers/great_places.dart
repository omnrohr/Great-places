import 'package:flutter/foundation.dart';
import 'dart:io';

import '../models/place.dart';
import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace({
    String title,
    File image,
  }) {
    final newPlace = Place(
        id: DateTime.now().toIso8601String(),
        title: title,
        location: null,
        image: image);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.dbInsert(table: 'places', data: {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }
}
