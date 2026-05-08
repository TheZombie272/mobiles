import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/place_store.dart';

class AddPlaceScreen extends StatefulWidget {
  final VoidCallback onPlaceAdded;

  const AddPlaceScreen({super.key, required this.onPlaceAdded});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _savePlace() {
    final name = _nameController.text.trim();
    final desc = _descController.text.trim();

    if (name.isNotEmpty && desc.isNotEmpty) {
      Provider.of<PlaceStore>(context, listen: false).addPlace(name, desc);
      widget.onPlaceAdded();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Place')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _savePlace,
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}