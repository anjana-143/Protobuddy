import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protobuddy/buttonnavbar/CustomBottomNavigationBar.dart';
import 'package:protobuddy/components/profile.dart';
import 'package:protobuddy/database/firebase.dart';
import 'package:protobuddy/models/usermodel.dart';
import 'package:protobuddy/pages/portfolio/portfolio.dart';
// import 'package:protobuddy/pages/portfolio/create_portfolio.dart';
import 'package:protobuddy/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel currentUser = UserModel();
  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  void initState() {
    super.initState();
    firestore
        .collection("protobuddy")
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) {
      currentUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // backgroundColor: black,
        child: UserProfile(),
      ),
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        centerTitle: true,
        title: Text(
          "Portfolio's",
          style: TextStyle(
            color: black,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 50),
            child: StreamBuilder(
                stream:
                    firestore.collection("protobuddy/data/portfolio").snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                  if (snapshot.hasError) {
                    return const Text("something is wrong");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: black,
                      ),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        QueryDocumentSnapshot data = snapshot.data!.docs[index];
                        return GestureDetector(
                            onTap: () {
                              Get.to(
                                // () => create_protfolio(),
                                () => PortfolioDetail(
                                  avatar: data['avatar'],
                                  description: data['description'],
                                  education: data['education'],
                                  email: data['email'],
                                  experience: data['experience'],
                                  name: data['name'],
                                  speciality: data['speciality'],
                                  work: data['work'],
                                  address: data['address'],
                                  title: data['title'],
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    // border: Border.all(
                                    //   color: Colors.grey,
          
                                    // ),
                                    color: Color.fromRGBO(226, 232, 240, 1),
                                    // borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 2,
                                        offset: const Offset(
                                            7, 4), // changes position of shadow
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        '${data['avatar']}',
                                        fit: BoxFit.cover,
                                        height: 80,
                                        width: 80,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
          // Usage
                                          Text(
                                            '${capitalizeFirstLetter(data['name'])}',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${capitalizeFirstLetter(data['title'])}',
                                            style: TextStyle(
                                                fontSize: 15, letterSpacing: 1.2),
                                          ),
                                          SizedBox(
                                             height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '${capitalizeFirstLetter(data['address']).length > 15 ? capitalizeFirstLetter(data['address']).substring(0, 15) + '...' : capitalizeFirstLetter(data['address'])}',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1.2),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      });
                  // return ListView.builde
                  //   itemCount: snapshot.data!.docs.length,
                  //   shrinkWrap: true,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     QueryDocumentSnapshot data = snapshot.data!.docs[index];
                  //     return GestureDetector(
                  //       onTap: () {
                  //         Get.to(
                  //           // () => create_protfolio()
                  //           () => PortfolioDetail(
                  //             avatar: data['avatar'],
                  //             description: data['description'],
                  //             education: data['education'],
                  //             email: data['email'],
                  //             experience: data['experience'],
                  //             name: data['name'],
                  //             speciality: data['speciality'],
                  //             work: data['work'],
                  //             address: data['address'],
                  //             title: data['title'],
                  //           ),
                  //         );
                  //       },
          
                  //       child: Container(
                  //         // width: double.infinity,
                  //         margin: const EdgeInsets.only(
                  //           bottom: 12,
                  //         ),
                  //         padding: const EdgeInsets.all(8),
                  //         decoration: BoxDecoration(
                  //           color: grey,
                  //           borderRadius: BorderRadius.circular(24),
                  //         ),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //               opacity: 0.3,
                  //               fit: BoxFit.fill,
                  //               image: NetworkImage('${data['work']}'),
                  //             ),
                  //             borderRadius: BorderRadius.circular(24),
                  //           ),
          
                  //           child: AspectRatio(
                  //             aspectRatio: 16 / 9,
                  //             child: Container(
                  //               margin: EdgeInsets.all(15),
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     '${data['name']}',
                  //                     style: TextStyle(
                  //                       fontSize: 21,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     '${data['title']}',
                  //                     style: TextStyle(
                  //                       fontSize: 17,
                  //                     ),
                  //                   ),
                  //                   Text('Description: ${data['description']}'),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
          
                  //     );
                  //   },
                  // );
                }),
          ),
       
       Positioned(child: CustomBottomNavigationBar(initialIndex: 0,),
       bottom: 0,
            left: 0,
            right: 0,) ],
      ),
    );
  }
}
