import 'package:ecorewards/widgets/ecorewardslogo.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.675148, 14.772281),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        EcoRewardsLogo(),
        SizedBox(
          width: 1000,
          height: 672,
          child: GoogleMap(initialCameraPosition: _kGooglePlex),
        )
      ],
    ));
  }
}
