import 'package:flutter/material.dart';
import 'package:flutter_university_project/src/start_page/image/image_without_text.dart';


class ImageWithText extends StatelessWidget {
  const ImageWithText({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(-0.24, 0.92),
      children: [
        ImageWithoutText(image: image, width: 324, height: 513),
        const ImageWithoutText(image: 'images/Banner Shades.png', width: 324, height: 513),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delightful Baked",
              style: TextStyle(
                fontSize: 27,
                color: Colors.white,
                fontWeight: FontWeight.bold ,
                fontFamily: 'Poppins'
              ),
            ),
            Text(
              "Creations",
              style: TextStyle(
                fontSize: 27,                
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'
              ),
            )
          ],
        ),

      ],
    );
  }
}