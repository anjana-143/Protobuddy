import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protobuddy/custom_widget/custom_textfield/custom_textfield.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25.h),
        Text('Email'),
        SizedBox(height: 5.h),
        CustomTextFieldWidget(
          textColor: Colors.black87,
          controller: controller,
          inputAction: TextInputAction.next,
          validator: (value) {
            if ((value ?? '').isEmpty) {
              return 'Username cannot be empty';
            } else {
              return null;
            }
          },
          radius: 15.r,
          borderSide: const BorderSide(width: 2, color: Color(0xFF0ABDEF)),
          backgroundColor: Colors.white,
          prefixIcon: Icon(
            Icons.account_circle_outlined,
            color: Colors.blue[700]!.withOpacity(0.3),
          ),
          hintText: 'Enter your email',
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 15.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}