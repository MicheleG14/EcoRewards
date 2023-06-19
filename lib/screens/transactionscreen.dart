import 'dart:async';
import 'package:ecorewards/widgets/ecorewardslogo.dart';
import 'package:flutter/material.dart';

import 'transactionstats_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  int insertedObjects = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    _startTimer();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    // Start a timer that runs every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        insertedObjects++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const EcoRewardsLogo(),
          const SizedBox(
            width: 350,
            child: Text(
              'Ecocompattatore n. 2352',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Transazione in corso...',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          const CircularProgressIndicator(color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    insertedObjects.toString(),
                    style: const TextStyle(
                        fontSize: 120, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'Oggetti inseriti',
                    style: TextStyle(fontSize: 24),
                  )
                ],
              ),
              SizedBox(
                  width: 100, child: Image.asset('assets/images/bottle.png'))
            ],
          ),
          const SizedBox(
            height: 40,
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
                      builder: (context) => TransactionStatsScreen(
                            insertedObjects: insertedObjects,
                          )));
            },
            icon: const Icon(
              Icons.check,
              size: 40,
            ),
            label: const Text('Termina Transazione'),
          ),
        ],
      ),
    );
  }
}
