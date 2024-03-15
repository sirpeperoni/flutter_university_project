import 'package:flutter/material.dart';
import 'package:flutter_university_project/src/start_page/header/header_text.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(left: 25, top: 10),
              onPressed: () => Navigator.pop(context),
              icon: Image.asset("images/Back Button.png"),
            ),
            const SizedBox(width: 25),
            const BakeryHeaderText(text: "bakery and patisserie", color: Color.fromRGBO(80, 80, 80, 1.0), image: 'images/Ellipse 1.png',),
            // Your widgets here
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
              
          ],
        ),
      ),
    );
  }
}











