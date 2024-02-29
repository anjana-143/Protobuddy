import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:protobuddy/auth/register/sub_widgets/image_picker_button.dart';
import 'package:protobuddy/auth/register/sub_widgets/login_text.dart';
import 'package:protobuddy/auth/register/sub_widgets/register_button.dart';
import 'package:protobuddy/auth/register/sub_widgets/register_image.dart';
import 'package:protobuddy/auth/register/sub_widgets/text_field_with_label.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: UserRegisterForm(),
        ),
      ),
    );
  }
}

class UserRegisterForm extends StatefulWidget {
  @override
  State<UserRegisterForm> createState() => _UserRegisterFormState();
}

class _UserRegisterFormState extends State<UserRegisterForm> {
  ImagePicker picker = ImagePicker();
  File? pickedImage;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _registerKey = GlobalKey<FormState>();

  Future<void> pickImage() async {
    try {
      XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        setState(() {
          pickedImage = File(pickedFile.path);
        });
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerKey,
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegisterImage(),
            SizedBox(height: 15.h),
            TextFieldWithLabel(
              labelText: 'Email',
              controller: email,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if ((value ?? '').isEmpty) {
                  return 'Email cannot be empty';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 15.h),
            TextFieldWithLabel(
              labelText: 'Full Name',
              controller: name,
              textInputType: TextInputType.text,
              validator: (value) {
                if ((value ?? '').isEmpty) {
                  return 'Full name cannot be empty';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 15.h),
            TextFieldWithLabel(
              labelText: 'Password',
              controller: password,
              textInputType: TextInputType.text,
              validator: (value) {
                if ((value ?? '').isEmpty) {
                  return 'Password field cannot be empty';
                } else {
                  return null;
                }
              },
            ),
             SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: pickedImage != null
        ? DecorationImage(
            image: FileImage(pickedImage!),
            fit: BoxFit.cover,
          )
        : null,
                        color: Colors.blueAccent.withOpacity(0.3),
                      ),
                      height: 100.h,
                      width: 100.w,
                    ),

                    //       ),
                  ),
            SizedBox(height: 15.h),
            ImagePickerButton(pickImage: pickImage),
            SizedBox(height: 15.h),
            RegisterButton(
              registerKey: _registerKey,
              name: name,
              email: email,
              password: password,
              pickedImage: pickedImage,
            ),
            LoginTextWidget(),
          ],
        ),
      ),
    );
  }
}