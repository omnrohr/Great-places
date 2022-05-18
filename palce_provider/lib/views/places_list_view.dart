import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
import 'add_place_view.dart';

class PlacesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your places'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceView.routName);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fechAndSetPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<GreatPlaces>(
                  child: const Center(
                    child: Text('Got no placese yes, start adding some!'),
                  ),
                  builder: (ctx, places, ch) => places.items.isEmpty
                      ? ch
                      : ListView.builder(
                          itemCount: places.items.length,
                          itemBuilder: (ctx, i) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage: FileImage(places.items[i].image),
                            ),
                            title: Text(
                              places.items[i].title,
                            ),
                            subtitle: Text(places.items[i].location.address),
                            onTap: () {
                              // TODO: go to daitail page.
                            },
                          ),
                        )),
        ));
  }
}
