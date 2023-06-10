import 'package:flutter/material.dart';
import '../widgets/ecorewardslogo.dart';

class CouponPageScreen extends StatefulWidget {
  const CouponPageScreen({super.key});

  @override
  State<CouponPageScreen> createState() => _CouponPageScreenState();
}

class _CouponPageScreenState extends State<CouponPageScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EcoRewardsLogo(),
          SizedBox(
            height: 60,
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child:
                      Image(image: AssetImage('assets/images/Coin.png')),
                ),
                Text('350',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                Text('crediti', style: TextStyle(fontSize: 26))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
