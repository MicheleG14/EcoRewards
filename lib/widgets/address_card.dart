import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard(
      {super.key,
      required this.title,
      required this.address,
      required this.city,
      required this.position,
      required this.icon});

  final String title, address, city, position;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        alignment: Alignment.center,
        width: 320,
        height: 150,
        decoration: BoxDecoration(
            color: Color(0xfff1ebf5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Icon(icon, size: 50),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      city,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      position,
                      style: const TextStyle(fontSize: 16, color: Colors.green),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
