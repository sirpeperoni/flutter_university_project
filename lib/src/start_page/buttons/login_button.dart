import 'package:flutter/material.dart';
import 'package:flutter_university_project/login_page/login_page.dart';

class  LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: 245,
            height: 46,
            child: MaterialButton(
              color: color,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              ),
          ),
        ),
        ),
    );
  }
}


