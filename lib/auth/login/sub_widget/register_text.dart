import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: RichText(
        text: TextSpan(
          text: "Don't have an account?",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '\tRegister',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                color: Colors.blueAccent,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed('/register');
                },
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}