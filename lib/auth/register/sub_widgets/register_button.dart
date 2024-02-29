import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protobuddy/custom_widget/custom_button/custom_button.dart';
import 'package:protobuddy/database/firebase.dart';

class RegisterButton extends StatefulWidget {
  final GlobalKey<FormState> registerKey;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController password;
  final File? pickedImage;

  const RegisterButton({
    required this.registerKey,
    required this.name,
    required this.email,
    required this.password,
    required this.pickedImage,
    Key? key,
  }) : super(key: key);

  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  bool _isRegistering = false;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      text1: 'Register',
      bgColor: Colors.blue,
      ftSize: 20.sp,
      bdRadius: 15.r,
      onPressed: _isRegistering ? null : _registerUser,
    );
  }

  Future<void> _registerUser() async {
    if (widget.registerKey.currentState!.validate()) {
      setState(() {
        _isRegistering = true;
      });

      try {
        await userRegister(
          name: widget.name.text,
          email: widget.email.text,
          password: widget.password.text,
          avatar: widget.pickedImage,
        );

        // Optionally, you can show a success message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration successful!'),
            duration: Duration(seconds: 2),
          ),
        );
      } catch (e) {

          String errorrMessage = e.toString();
              String errorLines = '';
              errorLines = errorrMessage.split(']').last;
        // Handle registration error, and show an error message to the user
        final snackBar = SnackBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            content: AwesomeSnackbarContent(
              title: 'Error',
              message: '$errorLines',
              contentType: ContentType.failure,
            ));
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      } finally {
        setState(() {
          _isRegistering = false;
        });
      }
    }
  }
}
