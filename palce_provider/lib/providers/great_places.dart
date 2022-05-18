import 'package:flutter/foundation.dart';
import 'dart:io';

import '../models/place.dart';
import '../helpers/db_helper.dart';
import '../helpers/locatoin_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace({
    String title,
    File image,
    PlaceLocation pickedLocation,
  }) async {
    final address = await LocationHelper.genarateAddress(
        latitude: pickedLocation.latitude, lonitude: pickedLocation.longtude);
    final updatedLocation = PlaceLocation(
        latitude: pickedLocation.latitude,
        longtude: pickedLocation.longtude,
        address: address);
    final newPlace = Place(
        id: DateTime.now().toIso8601String(),
        title: title,
        location: updatedLocation,
        image: image);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.dbInsert(table: 'user_places', data: {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location.latitude,
      'loc_lon': newPlace.location.longtude,
      'address': newPlace.location.address,
    });
  }

  Future<void> fechAndSetPlaces() async {
    final data = await DBHelper.getDBData('user_places');
    _items = data
        .map(
          (e) => Place(
            id: e['id'],
            title: e['title'],
            location: PlaceLocation(
              latitude: e['loc_lat'],
              longtude: e['loc_lon'],
              address: e['address'],
            ),
            image: File(
              e['image'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
