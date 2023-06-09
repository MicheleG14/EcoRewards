import 'package:flutter/material.dart';

class CouponPageScreen extends StatefulWidget {
  const CouponPageScreen({super.key});

  @override
  State<CouponPageScreen> createState() => _CouponPageScreenState();
}

class _CouponPageScreenState extends State<CouponPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
        Container(
          height: 60,
          width: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 40,
                height: 40,
                child: const Image(image: AssetImage('assets/images/Coin.png')),
              ),
              Text('350',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              Text('crediti', style: TextStyle(fontSize: 26))
            ],
          ),
        ),
      ],
      
    );
  }
}
