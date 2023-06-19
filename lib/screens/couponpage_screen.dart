import 'package:ecorewards/widgets/coupon_card.dart';
import 'package:flutter/material.dart';
import '../widgets/ecorewards_logo.dart';

class CouponPageScreen extends StatefulWidget {
  const CouponPageScreen({super.key});

  @override
  State<CouponPageScreen> createState() => _CouponPageScreenState();
}

class _CouponPageScreenState extends State<CouponPageScreen> {
  final List<CouponCard> list = [];

  @override
  void initState() {
    list.add(const CouponCard(
        imagePath: 'assets/images/amazon_logo.png',
        title: 'Amazon',
        description:
            'Amazon.com, Inc. è un\'azienda di commercio elettronico statunitense, con sede a Seattle nello stato di Washington.',
        price: '50 crediti = 5€'));

    list.add(const CouponCard(
        imagePath: 'assets/images/gamestop_logo.png',
        title: 'GameStop',
        description:
            'È il più grande rivenditore di videogiochi nuovi e usati nel mondo, ma si occupa anche della vendita di accessori per videogiochi, console ed altri',
        price: '50 crediti = 5€'));

    list.add(const CouponCard(
        imagePath: 'assets/images/sephora_logo.png',
        title: 'Sephora',
        description:
            'Sephora è una multinazionale di profumerie fondata in Francia nel 1970 ed acquisita da LVMH nel 1997. La catena Sephora include oltre 750 punti vendita in 17 paesi del mondo.',
        price: '50 crediti = 5€'));

    list.add(
      const CouponCard(
          imagePath: 'assets/images/paypal_logo.png',
          title: 'Paypal',
          description:
              'PayPal Holdings, Inc. è una società statunitense che offre servizi di pagamento digitale e di trasferimento di denaro tramite Internet fondata nel 1999 da Confinity.',
          price: '50 crediti = 5€'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const EcoRewardsLogo(),
          const SizedBox(
            height: 30,
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image(image: AssetImage('assets/images/coin.png')),
                ),
                Text('350',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                Text('crediti', style: TextStyle(fontSize: 26))
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: list.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(bottom: 8, left: 16, right: 16)
                      : const EdgeInsets.only(
                          bottom: 8, top: 8, left: 16, right: 16),
                  child: list[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
