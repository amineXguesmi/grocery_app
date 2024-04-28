import 'package:flutter/material.dart';
import 'package:grocery_app/app/modules/signup/views/signup_process.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                'assets/images/app_icon.png',
                fit: BoxFit.contain,
                width: 300,
                height: 300,
              ),
            ),
          ),
          SignUpProcess(),
        ],
      ),
    );
  }
}
