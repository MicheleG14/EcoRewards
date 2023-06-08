import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.only(top: 70),
              height: 80,
              width: 200,
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: const Image(
                  image: AssetImage('assets/images/EcoRewardsText.png'))),
        ),
        const Text('Benvenuto', style: TextStyle(fontSize: 44)),
        Container(
          margin: const EdgeInsets.only(top: 70),
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          height: 80,
          width: 350,
          child: Row(children: [
            Container(
                height: 80,
                width: 80,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: const Icon(Icons.qr_code_scanner, size: 60)),
            const Text('Tocca qui per inquadrare il QR Code')
          ]),
        )
      ],
    );
  }
}
