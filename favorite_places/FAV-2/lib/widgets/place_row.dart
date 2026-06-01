import 'package:flutter/material.dart';
import '../models/place.dart';

class PlaceRow extends StatelessWidget {
  final Place place;

  const PlaceRow({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(place.name, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(place.description, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}