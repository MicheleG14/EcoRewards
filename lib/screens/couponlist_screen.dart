import 'package:ecorewards/widgets/couponlist_card.dart';
import 'package:flutter/material.dart';

import '../widgets/ecorewards_logo.dart';

class CouponListScreen extends StatefulWidget {
  const CouponListScreen({super.key});

  @override
  State<CouponListScreen> createState() => _CouponListScreenState();
}

class _CouponListScreenState extends State<CouponListScreen> {
  List<CouponListCard> cards = [];

  @override
  void initState() {
    cards.add(CouponListCard(logo: 'assets/images/gamestop_logo.png',
        shop: 'GameStop',
        coupon: 'Buono sconto di 5€',
        icon: Icons.qr_code_2));

    cards.add(CouponListCard(logo: 'assets/images/amazon_logo.png',
        shop: 'Amazon',
        coupon: 'Buono sconto di 5€',
        icon: Icons.qr_code_2));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const EcoRewardsLogo(),
            const Text(
              'LISTA BUONI SCONTO',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: cards.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(bottom: 8, left: 16, right: 16)
                        : const EdgeInsets.only(
                        bottom: 8, top: 8, left: 16, right: 16),
                    child: cards[index],
                  );
                },
              ),
            )
          ],
        ));
  }
}
