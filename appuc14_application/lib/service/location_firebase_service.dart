import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';

class LocationFirestoreService {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection("locations");

  Future<void> saveLocation({
    required String name,
    required LatLng position,
  }) async {
    await collection.add({
      "name": name,
      "latitude": position.latitude,
      "longitude": position.longitude,
      "timestamp": FieldValue.serverTimestamp(),
    });
  }
}
