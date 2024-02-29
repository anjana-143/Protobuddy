
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protobuddy/auth/login/sub_widget/email_text_field.dart';
import 'package:protobuddy/auth/login/sub_widget/login_button.dart';
import 'package:protobuddy/auth/login/sub_widget/password_text_field.dart';
import 'package:protobuddy/auth/login/sub_widget/register_text.dart';
import 'package:protobuddy/auth/login/sub_widget/welcome_message.dart';
import 'package:protobuddy/constrant/app_icons.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({Key? key});

  @override
  Widget build(BuildContext context) {
   final TextEditingController email = TextEditingController();
   final TextEditingController password = TextEditingController();
    final _loginKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(16.sp),
          child: SingleChildScrollView(
            child: Form(
              key: _loginKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  WelcomeMessage(),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppIcons.loginIcon,
                      width: 200.w,
                      height: 200.h,
                    ),
                  ),
                  EmailTextField(controller: email),
                  PasswordTextField(controller: password),
                  LoginButton(
                    loginKey: _loginKey,
                    emailController: email,
                    passwordController: password,
                  ),
                  RegisterText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}