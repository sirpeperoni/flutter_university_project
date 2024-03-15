import 'package:flutter/material.dart';

class BakeryHeaderText extends StatelessWidget {
  const BakeryHeaderText({super.key, required this.text, required this.color, required this.image});
  final String text;
  final Color color;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: Image.asset(
                image,
                width: 22,
                height: 26,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w100,
                  color: color,
                  fontFamily: 'Rochester',
                ),
              ),
              ),
          ],
        ),
    );
  }
}