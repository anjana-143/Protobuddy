import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protobuddy/constrant/app_icons.dart';

class RegisterImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppIcons.registerImage,
        width: 200.w,
        height: 200.h,
      ),
    );
  }
}