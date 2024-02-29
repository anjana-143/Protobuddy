import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protobuddy/custom_widget/custom_button/custom_button.dart';
import 'package:protobuddy/database/firebase.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> loginKey;

  const LoginButton({
    required this.emailController,
    required this.passwordController,
    required this.loginKey,
  });

  @override
  Widget build(BuildContext context) {
    // final _loginKey = GlobalKey<FormState>();

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 15.h),
      child: CustomElevatedButton(
        bgColor: Color(0xFF0ABDEF),
    onPressed: () async {
  try {
    if (loginKey.currentState!.validate()) {
      await userLogin(
        email: emailController.text,
        password: passwordController.text,
      );
    } else {
      // Show validation error message
      showSnackbar(context, 'Invalid Credentials');
    }
  } catch (e) {
    // Handle specific authentication error
    print('Exception during login: $e');
    if (e is !FirebaseException) {
      // Firebase authentication error
      // showSnackbar(context, e.toString());
      String  errorrMessage = e.toString();
String errorLines = '';
      errorLines = errorrMessage.split(':').last;
     
      showSnackbar(context, errorLines);

      print(errorLines);
      // showSnackbar(context, errorLines[0]);
    } else {
      
    }
  }
},
        text1: 'Login',
        ftSize: 18.sp,
        bdRadius: 8.r,
      ),
    );
  }
  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: AwesomeSnackbarContent(
        title: 'Error',
        message: message,
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}