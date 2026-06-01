import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/place_store.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FavoritePlacesApp());
}

class FavoritePlacesApp extends StatelessWidget {
  const FavoritePlacesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlaceStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Favorite Places',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}