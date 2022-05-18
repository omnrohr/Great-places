import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widgets/image_input_widget.dart';
import '../providers/great_places.dart';
import '../widgets/location_input.dart';
import '../models/place.dart';

class AddPlaceView extends StatefulWidget {
  static const routName = '/add-place';
  @override
  State<AddPlaceView> createState() => _AddPlaceViewState();
}

class _AddPlaceViewState extends State<AddPlaceView> {
  final _inputController = TextEditingController();

  File _pickedImage;

  PlaceLocation _pickedLocation;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat, double lon) {
    _pickedLocation = PlaceLocation(latitude: lat, longtude: lon);
  }

  void _savePlace() {
    if (_pickedImage == null ||
        _inputController.text.isEmpty ||
        _pickedLocation == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false).addPlace(
        title: _inputController.text,
        image: _pickedImage,
        pickedLocation: _pickedLocation);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _inputController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(
                      _selectImage,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text('Add place'),
            elevation: 0,
            color: Theme.of(context).accentColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )
        ],
      ),
    );
  }
}
