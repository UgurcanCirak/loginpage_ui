import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // İşletmelerin koordinatları
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(36.1995, 29.6394),
    zoom: 13,
  );

  // İşletme marker'ları
  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('cerclerSubesi'),
      position: LatLng(36.19871539185301, 29.652023226216784),
      infoWindow: InfoWindow(title: 'Köy Kasabı Çerçiler Şubesi'),
    ),
    const Marker(
      markerId: MarkerId('agullu'),
      position: LatLng(36.21654365704988, 29.682629484555868),
      infoWindow: InfoWindow(title: 'Kaş Köy Kasabı Ağullu'),
    ),
    const Marker(
      markerId: MarkerId('ciftlik'),
      position: LatLng(36.25344440609445, 29.797261037590747),
      infoWindow: InfoWindow(title: 'Atahan Besicilik'),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("İşletmelerimiz"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
