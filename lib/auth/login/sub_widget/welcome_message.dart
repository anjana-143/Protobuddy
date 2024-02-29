import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 15.h),
      child: Align(
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            text: 'Welcome ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25.sp,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'To',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: ' ProtoBuddy!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
