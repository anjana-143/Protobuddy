import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:get/get.dart';

class LoginTextWidget extends StatelessWidget {
  const LoginTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: "Already have an account?",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '\tLogin',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color: Colors.blueAccent,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                Navigator.pushNamed(context,'/login');
                },
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}