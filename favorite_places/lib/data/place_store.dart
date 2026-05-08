import 'package:flutter/foundation.dart';
import '../models/place.dart';

class PlaceStore extends ChangeNotifier {
  final List<Place> _places = [
    Place(id: 1, name: 'Mount Fuji', description: 'Iconic volcano in Japan'),
    Place(id: 2, name: 'Eiffel Tower', description: 'Famous landmark in Paris'),
    Place(id: 3, name: 'Grand Canyon', description: 'Impressive natural formation in the USA'),
    Place(id:4, name: "LostCity", description: "This city doesn't exist in any other cities record")
  ];

  List<Place> get places => List.unmodifiable(_places);

  void addPlace(String name, String description) {
    final newPlace = Place(
      id: (_places.isNotEmpty ? _places.map((p) => p.id).reduce((a, b) => a > b ? a : b) : 0) + 1,
      name: name,
      description: description,
    );
    _places.add(newPlace);
    notifyListeners();
  }
}