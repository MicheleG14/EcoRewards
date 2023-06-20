import 'package:flutter/material.dart';

class CouponListCard extends StatelessWidget {
  const CouponListCard(
      {super.key,
      required this.logo,
      required this.shop,
      required this.coupon,
      required this.icon});

  final String logo, shop, coupon;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Color(0xFFf1ebf5),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(logo, width: 80),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  shop,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  coupon,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            Icon(
              icon,
              size: 60,
            )
          ],
        ),
      ),
    );
  }
}
