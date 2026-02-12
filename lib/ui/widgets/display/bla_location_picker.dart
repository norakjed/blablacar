import 'package:blablacaar/dummy_data/dummy_data.dart';
import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../theme/theme.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final TextEditingController _textController = TextEditingController();
  late List<Location> _filteredLocations;

  @override
  void initState() {
    super.initState();
    _filteredLocations = fakeLocations;
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredLocations = fakeLocations
          .where(
            (location) =>
                location.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select location")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(BlaSpacings.m),
            child: TextField(
              controller: _textController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: "Search location",
                prefixIcon: Icon(Icons.search),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredLocations.length,
              itemBuilder: (context, index) {
                final location = _filteredLocations[index];
                return ListTile(
                  leading: Icon(Icons.location_on, color: BlaColors.iconLight),
                  title: Text(
                    location.name,
                    style: TextStyle(color: BlaColors.neutral),
                  ),
                  subtitle: Text(
                    location.country.name,
                    style: TextStyle(color: BlaColors.neutralLight),
                  ),
                  onTap: () {
                    Navigator.pop(context, location);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
