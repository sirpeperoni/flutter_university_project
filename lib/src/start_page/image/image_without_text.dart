import 'package:flutter/material.dart';

class ImageWithoutText extends StatelessWidget {
  const ImageWithoutText({super.key, required this.image, required this.height, required this.width});
  final String image;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 18),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox.fromSize(
          size: const Size.fromRadius(260),
          child: Image.asset(
            image, 
            width: width, 
            height: height, 
            fit: BoxFit.cover)
          ),
      ),
    );
  }
}