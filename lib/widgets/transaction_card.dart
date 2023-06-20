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
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 125,
        decoration: BoxDecoration(
            color: Color(0xFFf1ebf5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(station,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22)),
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
                SizedBox(
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/bottle_icon.png', width: 25),
                      SizedBox(width: 10),
                      Text(objects,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))
                    ],
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/coin.png', width: 25),
                      SizedBox(width: 5),
                      Text(coins,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
