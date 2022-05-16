import 'package:flutter/material.dart';

class PlacesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
