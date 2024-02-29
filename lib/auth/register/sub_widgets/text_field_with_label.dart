import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protobuddy/custom_widget/custom_textfield/custom_textfield.dart';

class TextFieldWithLabel extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;

  const TextFieldWithLabel({
    required this.labelText,
    required this.controller,
    required this.textInputType,
    required this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        SizedBox(height: 5.h),
        CustomTextFieldWidget(
          textColor: Colors.black87,
          controller: controller,
          inputAction: TextInputAction.next,
          validator: validator,
          radius: 15.r,
          borderSide: const BorderSide(width: 2, color: Color(0xFF0ABDEF)),
          backgroundColor: Colors.white,
          prefixIcon: Icon(
            Icons.account_circle_outlined,
            color: Colors.blue[700]!.withOpacity(0.3),
          ),
          hintText: 'Enter your $labelText',
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