import 'package:flutter/material.dart';

class EcoRewardsLogo extends StatelessWidget {
  const EcoRewardsLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.only(top: 20),
          height: 100,
          width: 230,
          child: const Image(
              image: AssetImage('assets/images/ecorewardstext_logo.png'))),
    );
  }
}
