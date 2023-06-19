import 'package:flutter/material.dart';

class CouponCard extends StatefulWidget {
  const CouponCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.description,
      required this.price});

  final String imagePath, title, description, price;

  @override
  State<CouponCard> createState() => _CouponCardState();
}

class _CouponCardState extends State<CouponCard> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 320,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(color: Colors.grey, width: 0.7)),
              elevation: MaterialStateProperty.all<double>(4),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return AlertDialog(
                      title: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Container(
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 90,
                                width: 90,
                                child:
                                    Image(image: AssetImage(widget.imagePath))),
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
                              label: sliderValue.toInt().toString()+' crediti',
                              value: sliderValue,
                              onChanged: (newValue) {
                                setState(() {
                                  sliderValue = newValue;
                                  print(sliderValue);
                                });
                              },
                              divisions: 7,
                              min: 0,
                              max: 350,
                            ),
                            Text(
                              (sliderValue/10).toInt().toString() + '€',
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
                              Navigator.of(context).pop();
                            },
                            label: Text('Converti'),
                            icon: Icon(Icons.currency_exchange),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black))),
                      ],
                    );
                  });
                });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      height: 70,
                      width: 70,
                      child: Image(image: AssetImage(widget.imagePath))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(
                        height: 70,
                        width: 220,
                        child: Text(
                          widget.description,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      Text(
                        widget.price,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.green),
                      )
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
