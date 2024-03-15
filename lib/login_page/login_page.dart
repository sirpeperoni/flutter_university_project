import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_university_project/src/start_page/header/header_text.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final email = ValueNotifier("");
  final password = ValueNotifier("");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BackButtonHeader(),
            SizedBox(width: 25),
            BakeryHeaderText(text: "bakery and patisserie", color: Color.fromRGBO(80, 80, 80, 1.0), image: 'images/Ellipse 1.png',),
            // Your widgets here
          ],
        ),
      ),
      body:  SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(right: 52, left: 52),
              child: Column(
                children: [
                  const WelcomeWidget(),
                  const SizedBox(height: 20),
                  EmailInputWidget(),
                  TextButton(
                    onPressed: () {

                    },
                    child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.black87,
                          fontWeight: FontWeight.w100
                        ),
                    ),
                  ),
                  OrLoginWith(),
                  SizedBox(height: 10),
                  ContinueWithGoogle(),
                  SizedBox(height: 5),
                  ContinueWithFacebook(),
                  SizedBox(height: 5),
                  ContinueWithTwitter(),
                  SizedBox(height: 25),
                  DontHaveAccount(),
                ],
              ),
            )
          ),
    );
  }
}

class BackButtonHeader extends StatelessWidget {
  const BackButtonHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return             IconButton(
      padding: const EdgeInsets.only(left: 25, top: 10),
      onPressed: () => Navigator.pop(context),
      icon: Image.asset("images/Back Button.png"),
    );
  }
}

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 16, bottom: 36),
        child: const
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Welcome back!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  "Login to continue",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                  ),
                )
              ],
        )
    );
  }
}

class EmailInputWidget extends StatefulWidget {
  EmailInputWidget({Key? key}) : super(key: key);
  @override
  State<EmailInputWidget> createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  @override
    final emails = ["@gmail.com", "@yandex.ru", "@mail.com", "@rambler.ru", "@yahoo.com"];
    Color colorButton = Color.fromRGBO(159, 172, 220, 1.0);
    String email = '';
    String password = '';
    bool emailCheck = false;
    bool passwordCheck = false;
    final TextEditingController _passEmail = TextEditingController();
    final TextEditingController _passPassword = TextEditingController();

    void initState(){
    super.initState();
    _passEmail.addListener(() {
      if(_passEmail.text.length > 0){
          setState(() {
            emailCheck = true;
          });
      }
    });
    _passPassword.addListener(() {
      if(_passPassword.text.length > 0){
        setState(() {
          passwordCheck = true;
        });
      }
    });
    }
    @override
    void dispose(){
      _passEmail.dispose();
      _passPassword.dispose();
      super.dispose();
    }

  Widget build(BuildContext context) {
    return
      Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Email",
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _passEmail,
              onChanged: (value) {
                email = value;
                _passEmail.text = value;
              },
              decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: "Enter your email here",
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0)
              ),
            ),
            const SizedBox(height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passPassword,
                  onChanged: (value) {
                    password = value;
                    _passPassword.text = value;
                  },

                  decoration: const InputDecoration(
                      hintStyle:  TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      border:  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      hintText: "Enter your password here",
                      contentPadding:  EdgeInsets.fromLTRB(20, 0, 0, 0)
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            const RememberMeToggleButton(),
            const SizedBox(height: 20,),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child:
                ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: SizedBox(
                    height: 46,
                    child: MaterialButton(
                      color: _passEmail.text.length > 0 && _passPassword.text.length > 0 ? Color.fromRGBO(238, 116, 36, 1.0) : colorButton,
                      onPressed: () {
                        bool check = true;
                        for(var e in emails){
                          if(email.contains(e)){
                            check = false;
                          }
                        }
                        if(check){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Почта написана неправильно!"),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                ),

              ],
            ),
          ],
        ),
      );
  }
}






























class PasswordInputWidget extends StatelessWidget {
  PasswordInputWidget({super.key, required this.labelText, required this.hintText});

  final String labelText;
  final String hintText;
  String _text = '';
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Form(
        key: _form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              labelText,
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _pass,
              validator: (String? value) {
                if(value != null && value.isEmpty){
                  return 'Empty';
                } else if(value != null && value.length < 8){
                  return "Password must be atleast 8 characters long";
                } else return null;
              },
              decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: hintText,
                  contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0)
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );

  }

}


class RememberMeToggleButton extends StatefulWidget {
  const RememberMeToggleButton({super.key});

  @override
  State<RememberMeToggleButton> createState() => _RememberMeToggleButtonState();
}

class _RememberMeToggleButtonState extends State<RememberMeToggleButton> {

  bool? _checked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Colors.white;
    }
     BorderSide getBorderSideColor(Set<MaterialState> states) {
      return const BorderSide(color: Colors.black);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: 20,
                height: 20,
                child: Checkbox(
                    checkColor: Colors.black,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: _checked,
                    side: MaterialStateBorderSide.resolveWith(getBorderSideColor),
                    onChanged: (bool? value) => {
                      setState(() {
                        _checked = value;
                      })
                    }),
            ),
            const SizedBox(
                width: 10
            ),
            const Text(
                "Remember me",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
            ),
          ],
        ),
      ],
    );
  }
}


class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child:
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: SizedBox(
              height: 46,
              child: MaterialButton(
                color: const Color.fromRGBO(159, 172, 220, 1.0),
                onPressed: () {
                  final emails = ["@gmail.com", "@yandex.ru", "@mail.com", "@rambler.ru", "@yahoo.com"];
                  bool check = true;

                  if(check){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Почта написана неправильно!"),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),

    ],
    );
  }
}


class OrLoginWith extends StatelessWidget {
  const OrLoginWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("images/Line 1.png"),
        const Text("Or login with"),
        Image.asset("images/Line 1.png"),
      ],
    );
  }
}


class ContinueWithGoogle extends StatelessWidget {
  const ContinueWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: Card(
              color: Colors.white,
              child: TextButton(
                onPressed: () {
                  
                },
                child: Row(
                  children: [
                    const SizedBox(width: 30,),
                    Image.asset("images/Google.png"),
                    const SizedBox(width: 10,),
                    const Text(
                        "Continue with Google",
                        style: TextStyle(
                            color: Colors.black87
                        ),
                    )
                  ],
                ),
              ),
            ),
          )
        ),
      ],
    );
  }
}

class ContinueWithFacebook extends StatelessWidget {
  const ContinueWithFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
              height: 50,
              child: Card(
                color: Colors.white,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const SizedBox(width: 30,),
                      Image.asset("images/Facebook.png"),
                      const SizedBox(width: 10,),
                      const Text(
                          "Continue with Facebook",
                          style: TextStyle(
                              color: Colors.black87
                          ),
                      )
                    ],
                  ),
                ),
              ),
            )
        ),
      ],
    );
  }
}

class ContinueWithTwitter extends StatelessWidget {
  const ContinueWithTwitter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SizedBox(
              height: 50,
              child: Card(
                color: Colors.white,
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const SizedBox(width: 30,),
                      Image.asset("images/Twitter.png"),
                      const SizedBox(width: 10,),
                      const Text(
                          "Continue with Twitter",
                          style: TextStyle(
                            color: Colors.black87
                          ),
                      )
                    ],
                  ),
                ),
              ),
            )
        ),
      ],
    );
  }
}


class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account?",
          style: TextStyle(
            fontFamily: "Poppins",
          ),
        ),
        Text(
          " Sign Up",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        )
      ],
    );
  }
}


class MyWidget extends StatelessWidget {
  final ValueListenable<int> number;

  MyWidget(this.number);

  @override
  Widget build(BuildContext context) {
    return new Text(number.value.toString());
  }
}













