import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/place_store.dart';
import '../widgets/place_row.dart';
import 'add_place_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final places = context.watch<PlaceStore>().places;

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Places')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: places.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return PlaceRow(place: places[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddPlaceScreen(
                onPlaceAdded: () => Navigator.pop(context),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}