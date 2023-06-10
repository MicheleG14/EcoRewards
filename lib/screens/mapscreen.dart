import 'package:ecorewards/widgets/ecorewardslogo.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/address_card.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Posizione iniziale della mappa
  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(40.680571, 14.766266),
    zoom: 16,
  );

  GoogleMapController? mapController;
  Map<MarkerId, Marker> markers = {};

  @override
  void initState() {
    super.initState();

    // Aggiungi marker con onTap personalizzato
    markers[MarkerId('Ecocompattatore 2352')] = Marker(
      markerId: MarkerId('Ecocompattatore 2352'),
      position: LatLng(40.6837313, 14.7625798),
      onTap: () => _onMarkerTapped(
          'Ecocompattatore n.2352',
          'Via Principessa Sichelgaita 2',
          '84125 Salerno (SA)',
          '2.7 km dalla tua posizione',
          Icons.local_gas_station),
    );

    markers[MarkerId('Ecocompattatore 2353')] = Marker(
      markerId: MarkerId('Ecocompattatore 2353'),
      position: LatLng(40.679793, 14.767058),
      onTap: () => _onMarkerTapped(
          'Ecocompattatore n.2353',
          'Via Pietro Da Eboli 18',
          '84122 Salerno (SA)',
          '650 metri dalla tua posizione',
          Icons.local_gas_station),
    );

    markers[MarkerId('Ecocompattatore 2345')] = Marker(
      markerId: MarkerId('Ecocompattatore 2345'),
      position: LatLng(40.677959, 14.764829),
      onTap: () => _onMarkerTapped(
          'Ecocompattatore n.2345',
          'Via Giovanni Cuomo 9',
          '84122 Salerno (SA)',
          '1.1 km dalla tua posizione',
          Icons.local_gas_station),
    );

    markers[MarkerId('Ecocompattatore 2372')] = Marker(
      markerId: MarkerId('Ecocompattatore 2372'),
      position: LatLng(40.679112, 14.762472),
      onTap: () => _onMarkerTapped(
          'Ecocompattatore n.2372',
          'Via San Benedetto 28',
          '84122 Salerno (SA)',
          '1.7 km dalla tua posizione',
          Icons.local_gas_station),
    );

    markers[MarkerId('MyPosition')] = Marker(
      markerId: MarkerId('MyPosition'),
      position: LatLng(40.680571, 14.766266),
      infoWindow: const InfoWindow(title: 'La tua posizione'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)
      );
  }

  void _onMarkerTapped(String markerId, String address, String city,
      String position, IconData icon) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pop(); // Chiude il dialog quando si tocca all'esterno
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 570, // Imposta la posizione verticale desiderata
                  left: 50, // Imposta la posizione orizzontale desiderata
                  child: AddressCard(
                    title: markerId,
                    address: address,
                    city: city,
                    position: position,
                    icon: icon,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const EcoRewardsLogo(),
          Expanded(
            child: GoogleMap(myLocationEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: initialPosition,
              markers: Set<Marker>.of(markers.values),
              onMapCreated: _onMapCreated,
            ),
          ),
        ],
      ),
    );
  }
}
