import 'package:appuc14_application/service/location_firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../service/location_service.dart';
import '../service/geocoding_service.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final LocationService _locationService = LocationService();
  final GeocodingService _geocodingService = GeocodingService();
  final LocationFirestoreService _firestoreService = LocationFirestoreService();

  LatLng? currentPosition;
  final MapController _mapController = MapController();

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    final position = await _locationService.getCurrentLocation();

    if (position != null) {
      setState(() {
        currentPosition = LatLng(position.latitude, position.longitude);
      });

      _mapController.move(currentPosition!, 15);
    }
  }

  Future<void> _searchAndMove() async {
    final query = searchController.text.trim();
    if (query.isEmpty) return;

     final latLng = await _geocodingService.searchAddress(query);

    if (latLng == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Endereço não encontrado.")),
      );
      return;
    }

    setState(() {
      currentPosition = latLng;
    });

    _mapController.move(latLng, 16);

    //Perguntar nome para salvar
    _showSaveDialog(latLng);
  }

  

  void _showSaveDialog(LatLng pos) {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Salvar Local"),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: "Nome do local"),
        ),
        actions: [
          TextButton(
            child: const Text("Cancelar"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text("Salvar"),
            onPressed: () async {
              final name = nameController.text.trim();
              if (name.isNotEmpty) {
                await _firestoreService.saveLocation(name: name, position: pos);
              }
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Local salvo no Firebase!")),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa com Busca"),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _loadLocation,
          ),
        ],
      ),
      body: Column(
        children: [
          //Campo de busca
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Buscar endereço...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (_) => _searchAndMove(),
            ),
          ),

          Expanded(
            child: currentPosition == null
                ? const Center(child: CircularProgressIndicator())
                : FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter: currentPosition!,
                      initialZoom: 15,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      ),

                      MarkerLayer(
                        markers: [
                          Marker(
                            point: currentPosition!,
                            width: 80,
                            height: 80,
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
