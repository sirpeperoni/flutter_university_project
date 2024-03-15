import 'package:flutter/material.dart';
import 'package:flutter_university_project/src/start_page/header/header_text.dart';
import 'package:flutter_university_project/src/start_page/buttons/buttons.dart';
import 'package:flutter_university_project/src/start_page/image/image_with_text.dart';


class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BakeryHeaderText(text: "bakery and patisserie", color: Color.fromRGBO(80, 80, 80, 1.0), image: 'images/Ellipse 1.png',),
        ),
        body : const SingleChildScrollView(
            child: Column(
              children: [
                ImageWithText(image: 'images/Banner Photo.jpg'),
                Buttons(),
              ],
            ),
          ),
        );
  }
}