import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../screens/couponlist_screen.dart';

//ignore: must_be_immutable
class CouponInfoDialog extends StatefulWidget {
  CouponInfoDialog(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.description,
      required this.price,
      required this.sliderValue});

  final String title, imagePath, description, price;
  double sliderValue;

  @override
  State<CouponInfoDialog> createState() => _CouponInfoDialogState();
}

class _CouponInfoDialogState extends State<CouponInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Container(
        height: 300,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 90,
                width: 90,
                child: Image(image: AssetImage(widget.imagePath))),
            Text(widget.description),
            Text(
              widget.price,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            Slider(

              activeColor: Colors.black,
              label: widget.sliderValue.toInt().toString() + ' crediti',
              value: widget.sliderValue,
              onChanged: (newValue) {
                setState(() {
                  widget.sliderValue = newValue;
                  print(widget.sliderValue);
                });
              },
              divisions: 7,
              min: 0,
              max: 350,
            ),
            Text(
              (widget.sliderValue / 10).toInt().toString() + '€',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: Container(
                      height: 300,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: 90,
                              width: 90,
                              child:
                                  Image(image: AssetImage(widget.imagePath))),
                          Icon(Icons.check, color: Colors.green, size: 60),
                          Text(
                            'Sconto di ' +
                                (widget.sliderValue / 10).toInt().toString() +
                                '€ ottenuto con successo!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton.icon(
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: CouponListScreen(),
                            );
                          },
                          label: Text('Lista buoni sconto'),
                          icon: Icon(Icons.receipt),
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.black))),
                    ],
                  );
                },
              );
            },
            label: Text('Converti'),
            icon: Icon(Icons.currency_exchange),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black))),
      ],
    );
    ;
  }
}
