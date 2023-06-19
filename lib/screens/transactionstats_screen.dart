import 'package:ecorewards/screens/profilepagescreen.dart';
import 'package:ecorewards/widgets/ecorewardslogo.dart';
import 'package:flutter/material.dart';

class TransactionStatsScreen extends StatelessWidget {
  const TransactionStatsScreen({super.key, required this.insertedObjects});

  final int insertedObjects;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        EcoRewardsLogo(),
        SizedBox(
          width: 350,
          child: Text(
            'Ecocompattatore n. 2352',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '04/05/2023 16:42:28',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 50, child: Image.asset('assets/images/bottle.png')),
            Text(
              insertedObjects.toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Text('oggetti inseriti', style: TextStyle(fontSize: 30),)
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 50, child: Image.asset('assets/images/Coin.png')),
            Text(
              (insertedObjects*5).toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Text('crediti ricevuti', style: TextStyle(fontSize: 30),)
          ],
        ),
        const SizedBox(
          height: 60,
        ),
        ElevatedButton.icon(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
              side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(color: Colors.grey, width: 0.7)),
              elevation: MaterialStateProperty.all<double>(4),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                  fontFamily: "MadeTommy",
                  fontSize: 25,
                  fontWeight: FontWeight.bold))),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePageScreen()));
          },
          icon: const Icon(
            Icons.person,
            size: 40,
          ),
          label: const Text('Vai al profilo'),
        ),
      ],
    ));
  }
}
