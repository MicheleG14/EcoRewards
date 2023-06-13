import 'package:flutter/material.dart';
import '../widgets/ecorewardslogo.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const EcoRewardsLogo(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              height: 140,
              width: 140,
              child: const Text('Immagine profilo'),
            ),
            const SizedBox(width: 20),
            const Text('Mario Rossi', style: TextStyle(fontSize: 22))
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              height: 120,
              width: 120,
              child: const Text('Bottiglia'),
            ),
            const SizedBox(width: 40, height: 40),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              height: 120,
              width: 120,
              child: const Text('Moneta'),
            )
          ],
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('96'),
                SizedBox(
                    width: 120,
                    child: Text(
                      'Oggetti in plastica riciclati',
                      textAlign: TextAlign.center,
                    )),
                Text('28 kg')
              ],
            ),
            SizedBox(height: 20, width: 40),
            Column(
              children: [Text('275'), Text('crediti residui')],
            )
          ],
        ),
        const SizedBox(height: 20),
        Container(
          width: 100,
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          height: 80,
          width: 300,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          height: 80,
          width: 300,
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          height: 80,
          width: 300,
        )
      ]),
    );
  }
}
