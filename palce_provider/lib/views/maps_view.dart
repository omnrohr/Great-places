import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart';

class MapsView extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelectd;

  MapsView(
      {this.initialLocation =
          const PlaceLocation(latitude: 31.966555, longtude: 35.8746601),
      this.isSelectd = false});
  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    final CameraPosition _default = CameraPosition(
        // bearing: 192.8334901395799,
        target: LatLng(
            widget.initialLocation.latitude, widget.initialLocation.longtude),
        // tilt: 59.440717697143555,
        zoom: 16.151926040649414);
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (_pickedLocation != null)
            IconButton(
              onPressed: _pickedLocation != null
                  ? () {
                      Navigator.of(context).pop(_pickedLocation);
                    }
                  : null,
              icon: const Icon(Icons.check),
            ),
        ],
        title: const Text(
          'Your Map',
        ),
      ),
      body: GoogleMap(
        // initialCameraPosition: CameraPosition(
        //   target: LatLng(
        //       widget.initialLocation.latitude, widget.initialLocation.latitude),
        //   zoom: 14.0,
        // ),
        initialCameraPosition: _default,
        onTap: widget.isSelectd ? _selectLocation : null,
        markers: _pickedLocation == null
            ? {}
            : {
                Marker(
                  markerId: MarkerId('m1'),
                  position: _pickedLocation,
                )
              },
      ),
    );
  }
}
