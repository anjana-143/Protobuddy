import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:protobuddy/buttonnavbar/CustomBottomNavigationBar.dart';
import 'package:protobuddy/database/firebase.dart';
import 'package:protobuddy/utils/constants.dart';

class create_protfolio extends StatefulWidget {
  const create_protfolio({super.key});

  @override
  State<create_protfolio> createState() => _create_protfolioState();
}

class _create_protfolioState extends State<create_protfolio> {
  int itemCountTitle = 1;
  int itemCountEducation = 1;
  int itemCountWorkExperience = 1;
  int itemCountTechnicalSkills = 1;
  ImagePicker picker = ImagePicker();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController speciality = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController startYear = TextEditingController();
  TextEditingController endYear = TextEditingController();

  File? pickedImage;
  File? pickedWork;
  Future pickProfile() async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile == null) {
        // User canceled the image picking operation
        print("Image picking canceled by the user");
        return; // Exit the function without updating state
      }

      setState(() {
        pickedImage = File(pickedFile.path);
      });
    } on PlatformException catch (e) {
      print("Error picking image: $e");
    }
  }

  Future pickWork() async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile == null) {
        print("Image picking canceled by the user");
        return;
      }

      setState(() {
        pickedWork = File(pickedFile.path);
      });
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
        ),
        centerTitle: true,
         title: const Text(
        'Portfolio',
      style: TextStyle(
          color: Colors.black
          ),
       ),
       ),

      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Photo of the user
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 48.0),
                        child: IconButton(
                          iconSize: 140,
                          icon: Material(
                            elevation: 10,
                            shape: const CircleBorder(),
                            child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Color.fromARGB(255, 255, 134, 59),
                                backgroundImage: pickedImage != null
                                    ? FileImage(
                                        pickedImage as File,
                                      )
                                    : null,
                                child: pickedImage != null
                                    ? null
                                    : const Text(
                                        'Select \n User \n Picture',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                          ),
                          onPressed: () {
                            pickProfile();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Name
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(226, 232, 240, 1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Color.fromARGB(255, 163, 163, 163), width: 0.5),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 25.0, left: 24, right: 24),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: TextField(
                                  controller: name,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    // labelText: 'Name',
                                    hintText: 'Enter your name',
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Email
                            Padding(
                              padding: EdgeInsets.only(top: 0.0, left: 24, right: 24),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: TextField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    // labelText: 'Name',
                                    hintText: 'Enter your email',
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // Address
                            Padding(
                              padding: EdgeInsets.only(top: 0.0, left: 24, right: 24),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: TextField(
                                  controller: address,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    // labelText: 'Name',
                                    hintText: 'Enter your address',
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                            ),
                            
                            // Career Objectives
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, left: 24, right: 24),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: TextField(
                                  controller: description,
                                  maxLines: 10,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10, top: 25),
                            
                                    // labelText: 'Name',
                                    hintText: 'Carrer Objectives',
                            
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
            
                    // Users work title
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        // rgb(226,232,240)
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(226, 232, 240, 1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Color.fromARGB(255, 163, 163, 163), width: 0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: Text(
                                  'Title',
                                  style: TextStyle(fontSize: 20, letterSpacing: 1.2),
                                ),
                              ),
                              // Text('anc'),
                              ListView.builder(
                                padding: EdgeInsets.only(top: 10),
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(left: 0.0, right: 0, top: 0),
                                    child: Column(
                                      children: [
                                        Container(
                                          // width: 200,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
            
                                          child: TextField(
                                            controller: title,
                                            style: TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(left: 20),
                                              hintText: 'Title',
                                              hintStyle: TextStyle(
                                                  color: Color.fromARGB(255, 27, 27, 27)),
                                              // hintText: 'Enter your name',
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: itemCountTitle == 1 ? false : true,
                                          child: const SizedBox(
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: itemCountTitle,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Add button
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       ElevatedButton(
                    //           onPressed: () {
                    //             setState(() {
                    //               itemCountTitle = itemCountTitle + 1;
                    //             });
                    //           },
                    //           child: Text('Add')),
                    //     ],
                    //   ),
                    // ),
            
                    const SizedBox(height: 20),
                    // Education of the user
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        // rgb(226,232,240)
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(226, 232, 240, 1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Color.fromARGB(255, 15, 15, 15), width: 0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: Text(
                                  'Education',
                                  style: TextStyle(fontSize: 20, letterSpacing: 1.2),
                                ),
                              ),
                              // Text('anc'),
                              ListView.builder(
                                padding: EdgeInsets.only(top: 10),
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(left: 0.0, right: 0, top: 0),
                                    child: Column(
                                      children: [
                                        Container(
                                          // width: 200,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
            
                                          child:  TextField(
                                            controller: education,
                                            style: TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(left: 20),
                                              hintText: 'Education',
                                              hintStyle: TextStyle(
                                                  color: Color.fromARGB(255, 160, 159, 159)),
                                              // hintText: 'Enter your name',
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              itemCountEducation == 1 ? false : true,
                                          child: const SizedBox(
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: itemCountEducation,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            
                    // Add button
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       ElevatedButton(
                    //           onPressed: () {
                    //             setState(() {
                    //               itemCountEducation = itemCountEducation + 1;
                    //             });
                    //           },
                    //           child: const Text(
                    //             'Add ',
                    //             style: TextStyle(
                    //                 fontSize: 16,
                    //                 color: Color.fromARGB(255, 255, 255, 255)),
                    //           )),
                    //     ],
                    //   ),
                    // ),
            
                    const SizedBox(
                      height: 20,
                    ),
                    // Work Experience of the user
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        // rgb(226,232,240)
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(226, 232, 240, 1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Color.fromARGB(255, 163, 163, 163), width: 0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: Text(
                                  'Work Experience',
                                  style: TextStyle(fontSize: 20, letterSpacing: 1.2),
                                ),
                              ),
                              // Text('anc'),
                              ListView.builder(
                                padding: EdgeInsets.only(top: 10),
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(left: 0.0, right: 0, top: 0),
                                    child: Column(
                                      children: [
                                        Container(
                                          // width: 200,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
            
                                          child:  TextField(
                                            controller: experience ,
                                            style: TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(left: 20),
                                              hintText: 'Work Experience',
                                              hintStyle: TextStyle(
                                                  color: Color.fromARGB(255, 8, 8, 8)),
                                              // hintText: 'Enter your name',
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                          ),
                                        ),
                                       
                                        // Row(
                                        //   children: [
                                        //     Flexible(
                                        //         flex: 1,
                                        //         child: Container(
                                        //           decoration: BoxDecoration(
                                        //               color: Colors.white,
                                        //               borderRadius:
                                        //                   BorderRadius.circular(4)),
                                        //           child: TextField(
                                        //             controller: startYear,
                                        //             decoration: InputDecoration(
                                        //               contentPadding:
                                        //                   EdgeInsets.only(left: 20),
                                        //               hintText: 'Start Year',
                                        //               hintStyle: TextStyle(
                                        //                   color: Color.fromARGB(255, 7, 7, 7)),
                                        //               // hintText: 'Enter your name',
                                        //               border: OutlineInputBorder(
                                        //                   borderSide:
                                        //                       BorderSide.none),
                                        //             ),
                                        //           ),
                                        //         )),
                                        //     SizedBox(
                                        //       width: 20,
                                        //     ),
                                        //     Flexible(
                                        //         flex: 1,
                                        //         child: Container(
                                        //           decoration: BoxDecoration(
                                        //               color: Colors.white,
                                        //               borderRadius:
                                        //                   BorderRadius.circular(4)),
                                        //           child: TextField(
                                        //             controller: endYear,
                                        //             decoration: InputDecoration(
                                        //               contentPadding:
                                        //                   EdgeInsets.only(left: 20),
                                        //               hintText: 'End Year',
                                        //               hintStyle: TextStyle(
                                        //                   color: Color.fromARGB(255, 8, 8, 8)),
                                        //               // hintText: 'Enter your name',
                                        //               border: OutlineInputBorder(
                                        //                   borderSide:
                                        //                       BorderSide.none),
                                        //             ),
                                        //           ),
                                        //         )),
                                        //   ],
                                        // ),
                                        Visibility(
                                          visible: itemCountWorkExperience == 1
                                              ? false
                                              : true,
                                          child: const SizedBox(
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: itemCountWorkExperience,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            
                    // //Add button
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       ElevatedButton(
                    //           onPressed: () {
                    //             setState(() {
                    //               itemCountWorkExperience =
                    //                   itemCountWorkExperience + 1;
                    //             });
                    //           },
                    //           child: const Text(
                    //             'Add ',
                    //             style: TextStyle(
                    //                 fontSize: 16,
                    //                 color: Color.fromARGB(255, 255, 255, 255)),
                    //           )),
                    //     ],
                    //   ),
                    // ),
            
                    const SizedBox(
                      height: 20,
                    ),
                    // Technical Skills of the user
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        // rgb(226,232,240)
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(226, 232, 240, 1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Color.fromARGB(255, 163, 163, 163), width: 0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: Text(
                                  'Work title',
                                  style: TextStyle(fontSize: 20, letterSpacing: 1.2),
                                ),
                              ),
                              // Text('anc'),
                              ListView.builder(
                                padding: EdgeInsets.only(top: 10),
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(left: 0.0, right: 0, top: 0),
                                    child: Column(
                                      children: [
                                        Container(
                                          // width: 200,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 255, 255, 255),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
            
                                          child:  TextField(
                                            controller: speciality ,
                                            style: TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(left: 20),
                                              hintText: 'Work Title',
                                              hintStyle: TextStyle(
                                                  color: Color.fromARGB(255, 14, 13, 13)),
                                              // hintText: 'Enter your name',
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: itemCountTechnicalSkills == 1
                                              ? false
                                              : true,
                                          child: const SizedBox(
                                            height: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: itemCountTechnicalSkills,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        // rgb(226,232,240)
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(226, 232, 240, 1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Color.fromARGB(255, 163, 163, 163), width: 0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: Text(
                                  'Choose Work',
                                  style: TextStyle(fontSize: 20, letterSpacing: 1.2),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
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
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: (pickedWork == null)
                                      ? Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Choose a Work',
                                                style: TextStyle(
                                                  color: white,
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
                              // Text('anc'),
                              // ListView.builder(
                              //   padding: EdgeInsets.only(top: 10),
                              //   itemBuilder: (BuildContext context, index) {
                              //     return Padding(
                              //       padding:
                              //           EdgeInsets.only(left: 0.0, right: 0, top: 0),
                              //       child: Column(
                              //         children: [
            
                              //           Visibility(
                              //             visible: itemCountTechnicalSkills == 1
                              //                 ? false
                              //                 : true,
                              //             child: const SizedBox(
                              //               height: 30,
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     );
                              //   },
                              //   itemCount: itemCountTechnicalSkills,
                              //   shrinkWrap: true,
                              //   physics: const NeverScrollableScrollPhysics(),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
            
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       ElevatedButton(
                    //         style: ButtonStyle(
                    //           // backgroundColor: MaterialStateProperty.all(
                    //           //     Color.fromRGBO(31, 236, 255, 1)),
                    //           padding: MaterialStateProperty.all(
                    //               EdgeInsets.only(top: 10, bottom: 10)),
            
                    //         ),
                    //           onPressed: () {
                    //             setState(() {
                    //               itemCountTechnicalSkills =
                    //                   itemCountTechnicalSkills + 1;
                    //             });
                    //           },
                    //           child: const Text(
                    //             'Add ',
                    //             style: TextStyle(
                    //                 fontSize: 16,
                    //                 color: Color.fromARGB(255, 255, 255, 255)),
                    //           )),
                    //     ],
                    //   ),
                    // ),
            
                    const SizedBox(
                      height: 20,
                    ),
            
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(117, 185, 0, 1)),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.only(top: 15, bottom: 15))),
                              onPressed: () {
                                print(education);
                                createPortfolio(
                                  name: name.text,
                                  email: email.text,
                                  speciality: speciality.text,
                                  experience: experience.text,
                                  education: education.text,
                                  description: description.text,
                                  profile: pickedImage,
                                  work: pickedWork,
                                  address: address.text,
                                  title: title.text,
                                );
                              },
                              child: Text(
                                'Create Portfolio',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ))),
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          ),
        Positioned(child: CustomBottomNavigationBar(initialIndex: 1,),
        bottom: 0,
            left: 0,
            right: 0,)
        ],
      ),
    );
  }
}
