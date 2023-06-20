import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.route});

  final IconData icon;
  final String title, subtitle;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 90,
      width: 370,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route));
        },
        icon: Icon(icon, size: 50),
        label: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: 'MadeTommy'),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontFamily: 'MadeTommy',
                  fontSize: 15,
                  color: Color(0xff979797)),
            )
          ],
        ),
        style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
                const BorderSide(color: Colors.grey, width: 0.7)),
            elevation: MaterialStateProperty.all<double>(4),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      ),
    );
  }
}
