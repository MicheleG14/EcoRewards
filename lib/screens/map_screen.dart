import 'package:ecorewards/widgets/ecorewards_logo.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/address_card.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Posizione iniziale della mappa
  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(40.680571, 14.766266),
    zoom: 16,
  );

  List<AddressCard> cards = [];

  bool showMap = true;
  GoogleMapController? mapController;
  Map<MarkerId, Marker> markers = {};

  @override
  void initState() {
    super.initState();

    markers[const MarkerId('Ecocompattatore 2352')] = Marker(
      markerId: const MarkerId('Ecocompattatore 2352'),
      position: const LatLng(40.6837313, 14.7625798),
      onTap: () => _onMarkerTapped(
          'Ecocompattatore n.2352',
          'Via Principessa Sichelgaita 2',
          '84125 Salerno (SA)',
          '2.7 km dalla tua posizione',
          Icons.local_gas_station),
    );

    markers[const MarkerId('Ecocompattatore 2353')] = Marker(
      markerId: const MarkerId('Ecocompattatore 2353'),
      position: const LatLng(40.679793, 14.767058),
      onTap: () => _onMarkerTapped(
          'Ecocompattatore n.2353',
          'Via Pietro Da Eboli 18',
          '84122 Salerno (SA)',
          '650 metri dalla tua posizione',
          Icons.local_gas_station),
    );

    markers[const MarkerId('Ecocompattatore 2345')] = Marker(
      markerId: const MarkerId('Ecocompattatore 2345'),
      position: const LatLng(40.677959, 14.764829),
      onTap: () => _onMarkerTapped(
          'Ecocompattatore n.2345',
          'Via Giovanni Cuomo 9',
          '84122 Salerno (SA)',
          '1.1 km dalla tua posizione',
          Icons.local_gas_station),
    );

    markers[const MarkerId('Ecocompattatore 2372')] = Marker(
      markerId: const MarkerId('Ecocompattatore 2372'),
      position: const LatLng(40.679112, 14.762472),
      onTap: () => _onMarkerTapped(
          'Ecocompattatore n.2372',
          'Via San Benedetto 28',
          '84122 Salerno (SA)',
          '1.7 km dalla tua posizione',
          Icons.local_gas_station),
    );

    markers[const MarkerId('MyPosition')] = Marker(
        markerId: const MarkerId('MyPosition'),
        position: const LatLng(40.680571, 14.766266),
        infoWindow: const InfoWindow(title: 'La tua posizione'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan));

    cards.add(const AddressCard(
        title: 'Ecocompattatore n.2352',
        address: 'Via Principessa Sichelgaita 2',
        city: '84125 Salerno (SA)',
        position: '2.7 km dalla tua posizione',
        icon: Icons.local_gas_station));

    cards.add(const AddressCard(
        title: 'Ecocompattatore n.2352',
        address: 'Via Pietro Da Eboli 18',
        city: '84122 Salerno (SA)',
        position: '1.1 km dalla tua posizione',
        icon: Icons.local_gas_station));

    cards.add(const AddressCard(
        title: 'Ecocompattatore n.2345',
        address: 'Via Giovanni Cuomo 9',
        city: '84122 Salerno (SA)',
        position: '650 metri dalla tua posizione',
        icon: Icons.local_gas_station));

    cards.add(const AddressCard(
        title: 'Ecocompattatore n.2372',
        address: 'Via San Benedetto 28',
        city: '84122 Salerno (SA)',
        position: '1.7 km dalla tua posizione',
        icon: Icons.local_gas_station));
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
        return StatefulBuilder(
          builder: (BuildContext dialogContext, StateSetter setState) {
            return GestureDetector(
              onTap: () {
                Navigator.of(dialogContext).pop();
              },
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 570, // Set the desired vertical position
                      left: 50, // Set the desired horizontal position
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    showMap ? Colors.green : Colors.transparent,
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    showMap ? Colors.white : Colors.black,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    showMap = true;
                  });
                },
                child: const Text('MAPPA'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    showMap ? Colors.transparent : Colors.green,
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    showMap ? Colors.black : Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    showMap = false;
                  });
                },
                child: const Text('LISTA'),
              ),
            ],
          ),
          Expanded(
            child: Visibility(
              visible: showMap,
              maintainAnimation: true,
              maintainState: true,
              child: GoogleMap(
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                initialCameraPosition: initialPosition,
                markers: Set<Marker>.of(markers.values),
                onMapCreated: _onMapCreated,
              ),
            ),
          ),
          Visibility(
            visible: !showMap,
            maintainState: true,
            maintainAnimation: true,
            child: SizedBox(
              height: 620,
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(bottom: 8, left: 8, right: 8)
                        : const EdgeInsets.all(8),
                    child: cards[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
