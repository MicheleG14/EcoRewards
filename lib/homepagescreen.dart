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
              margin: const EdgeInsets.only(top: 20),
              height: 100,
              width: 230,
              child: const Image(
                  image: AssetImage('assets/images/EcoRewardsText.png'))),
        ),
        const Text('Benvenuto',
            style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold)),
        Container(
          margin: EdgeInsets.only(top: 50, bottom: 25),
          height: 80,
          width: 350,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.qr_code_2, size: 50),
            label: const Text('Tocca qui per inquadrare il QR code',
                softWrap: true),
            style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(color: Colors.grey, width: 0.7)),
                elevation: MaterialStateProperty.all<double>(4),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold))),
          ),
        ),
        const Text('oppure',
            style: TextStyle(fontSize: 16, color: Colors.grey)),
        Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: const Icon(Icons.contactless_outlined, size: 70)),
        const Text(
          'Avvicina il dispositivo alla stazione di riciclo.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        )
      ],
    );
  }
}
