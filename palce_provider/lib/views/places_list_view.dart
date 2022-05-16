import 'package:flutter/material.dart';
import 'add_place_view.dart';

class PlacesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('buiding places list');
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceView.routName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        // child: CircularProgressIndicator(),
        child: Text('list view page'),
      ),
    );
  }
}
