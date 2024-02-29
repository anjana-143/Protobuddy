import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:protobuddy/database/firebase.dart';
import 'package:protobuddy/utils/constants.dart';
import 'package:protobuddy/widgets/textformfeild.dart';

class PostSell extends StatefulWidget {
  const PostSell({super.key});

  @override
  State<PostSell> createState() => _PostSellState();
}

class _PostSellState extends State<PostSell> {
  ImagePicker picker = ImagePicker();

  File? pickedWork;

  Future pickWork() async {
    try {
      XFile? pickedFile = (await ImagePicker().pickImage(
        source: ImageSource.gallery,
      ));
      setState(() {
        pickedWork = File(pickedFile!.path);
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  TextEditingController title = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sell Works"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.all(12),
          child: Form(
              child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  pickWork();
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                    image: pickedWork != null
                        ? DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: FileImage(
                              pickedWork as File,
                            ),
                          )
                        : null,
                    color: red,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: (pickedWork == null)
                      ? Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Choose a Work',
                                style: TextStyle(
                                  color: black.withOpacity(0.5),
                                ),
                              ),
                              Icon(
                                LineIcons.fileUpload,
                              ),
                            ],
                          ),
                        )
                      : AspectRatio(
                          aspectRatio: 16 / 9,
                        ),
                ),
              ),
              customFormFeild(
                controller: title,
                hintText: 'Title',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              customFormFeild(
                controller: category,
                hintText: 'Category',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              customFormFeild(
                controller: description,
                hintText: 'Description',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              MaterialButton(
                onPressed: () {
                  sellWorks(
                    title: title.text,
                    category: category.text,
                    description: description.text,
                    work: pickedWork,
                  );
                },
                color: grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Post Work',
                    style: TextStyle(
                      color: black,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
