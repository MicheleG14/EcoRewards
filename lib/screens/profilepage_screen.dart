import 'package:ecorewards/screens/transactionlist_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/ecorewards_logo.dart';
import '../widgets/profile_button.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const EcoRewardsLogo(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 125,
                width: 125,
                child: Image.asset('assets/images/mariorossi_img.png')),
            const SizedBox(width: 20),
            const Text(
              'Mario Rossi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 30, child: Image.asset('assets/images/bottle.png')),
            const Column(children: [
              Text(
                '96',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 125,
                child: Text(
                  textAlign: TextAlign.center,
                  'oggetti in plastica riciclati',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Text('26 kg',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
            ]),
            SizedBox(
                height: 60,
                width: 60,
                child: Image.asset('assets/images/coin.png')),
            const Column(
              children: [
                Text(
                  '350',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text('crediti residui', style: TextStyle(fontSize: 16))
              ],
            )
          ],
        ),
        const SizedBox(height: 25),
        Container(
            width: 250,
            decoration: BoxDecoration(border: Border.all(color: Colors.black))),
        const SizedBox(height: 25),
        const ProfileButton(
            icon: Icons.receipt,
            title: 'Lista transazioni',
            subtitle: 'Tocca qui per vedere le ultime transazioni effettuate.',
            route: TransactionListScreen()),
        const ProfileButton(
            icon: Icons.question_answer,
            title: 'Hai qualche domanda?',
            subtitle:
                'Tocca qui per scoprire informazioni relative al processo di riciclo della plastica.',
            route: TransactionListScreen()),
        const ProfileButton(
            icon: Icons.receipt,
            title: 'Invita gli amici!',
            subtitle:
                'Condividi un link di invito ai tuoi amici. Per ogni invitato riceverai 5 crediti in omaggio!',
            route: TransactionListScreen()),
      ],
    ));
  }
}
