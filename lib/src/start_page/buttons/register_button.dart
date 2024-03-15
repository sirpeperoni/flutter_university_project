import 'package:flutter/material.dart';
import 'package:flutter_university_project/register_page/register_page.dart';

class  RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.text, required this.color});
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
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
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


