import 'package:flutter/material.dart';
import 'package:protobuddy/utils/constants.dart';

Container customFormFeild({
  required controller,
  required hintText,
  required keyboardType,
  required obscureText,
  required textInputAction,
}) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(
      bottom: 12,
    ),
    padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
    decoration: BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(24),
    ),
    child: TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      cursorColor: black,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
      ),
    ),
  );
}
