import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(
      {super.key,
      required this.station,
      required this.address,
      required this.city,
      required this.date,
      required this.objects,
      required this.coins});

  final String station, address, city, date, objects, coins;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 125,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(station,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                Text(
                  address,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(city, style: const TextStyle(fontSize: 20)),
                Text(date, style: const TextStyle(fontSize: 20))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/bottle.png', width: 15),
                    Text(objects,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/images/Coin.png', width: 25),
                    Text(coins,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
