import 'package:camera/camera.dart';
import 'package:ecorewards/screens/transactionscreen.dart';
import 'package:flutter/material.dart';

class QRButton extends StatelessWidget {
  const QRButton({super.key, required this.cameras});

  final List<CameraDescription> cameras;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 25),
      height: 80,
      width: 350,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CameraScreen(cameras: cameras)));
        },
        icon: const Icon(Icons.qr_code_2, size: 50),
        label: const Text('Tocca qui per inquadrare il QR code',
            softWrap: true, style: TextStyle(fontFamily: 'MadeTommy')),
        style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
                const BorderSide(color: Colors.grey, width: 0.7)),
            elevation: MaterialStateProperty.all<double>(4),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      ),
    );
  }
}
