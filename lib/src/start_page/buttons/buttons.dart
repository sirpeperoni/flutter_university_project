import 'package:flutter/material.dart';
import 'package:flutter_university_project/src/start_page/buttons/login_button.dart';
import 'package:flutter_university_project/src/start_page/buttons/register_button.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8),
      child: Column(
        children: [
          LoginButton(text: "Login", color: Color.fromRGBO(238, 116, 36, 1.0),),
          RegisterButton(text: "Sign Up", color: Color.fromRGBO(159, 172, 220, 1.0),),
        ],
      ),
    );
  }
}