import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protobuddy/custom_widget/custom_textfield/custom_textfield.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),
        Text('Password'),
        SizedBox(height: 5.h),
        CustomTextFieldWidget(
          textColor: Colors.black87,
          controller: controller,
          inputAction: TextInputAction.done,
          validator: (value) {
            if ((value ?? '').isEmpty) {
              return 'password field cannot be empty';
            } else {
              return null;
            }
          },
          borderSide: BorderSide(
            width: 2.w,
            color: Color(0xFF0ABDEF),
          ),
          radius: 15.r,
          hintText: 'Enter your password',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
          isPassword: true,
          backgroundColor: Colors.white,
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.blue[700]!.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
