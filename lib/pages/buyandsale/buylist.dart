import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protobuddy/buttonnavbar/CustomBottomNavigationBar.dart';
import 'package:protobuddy/database/firebase.dart';
import 'package:protobuddy/pages/buyandsale/viewwork.dart';
import 'package:protobuddy/utils/constants.dart';

class BuyList extends StatefulWidget {
  const BuyList({super.key});

  @override
  State<BuyList> createState() => _BuyListState();
}

class _BuyListState extends State<BuyList> {
  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
        ),        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "All for Sale",
          style: TextStyle(color: black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 150,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.fromLTRB(20, 20, 20, 50),
            child: StreamBuilder(
                stream:
                    firestore.collection("protobuddy/data/forSell").snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
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

                  List<QueryDocumentSnapshot> filteredData = snapshot.data!.docs
                      .where((data) =>
                          data['title']
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase()) ||
                          data['description']
                              .toLowerCase()
                              .contains(searchQuery.toLowerCase()))
                      .toList();

                  return ListView.builder(
                    itemCount: filteredData.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      QueryDocumentSnapshot data = filteredData[index];
                      // return GestureDetector(
                      //   onTap: () {
                      //     Get.to(() => ViewWork(
                      //           work: '${data['work']}',
                      //           email: '${data['email']}',
                      //         ));
                      //   },
                      //   child: Container(
                      //     width: double.infinity,
                      //     margin: const EdgeInsets.only(
                      //       bottom: 12,
                      //     ),
                      //     padding: const EdgeInsets.all(8),
                      //     decoration: BoxDecoration(
                      //       color: grey,
                      //       borderRadius: BorderRadius.circular(24),
                      //     ),
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //           opacity: 0.3,
                      //           fit: BoxFit.fill,
                      //           image: NetworkImage('${data['work']}'),
                      //         ),
                      //         borderRadius: BorderRadius.circular(24),
                      //       ),
                      //       child: AspectRatio(
                      //         aspectRatio: 16 / 9,
                      //         child: Container(
                      //           margin: EdgeInsets.all(15),
                      //           child: Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 'Title: ${data['title']}',
                      //                 style: TextStyle(
                      //                   fontSize: 19,
                      //                 ),
                      //               ),
                      //               Text('Description: ${data['description']}'),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // );
                      return GestureDetector(
                          onTap: () {
                            Get.to(() => ViewWork(
                                  work: '${data['work']}',
                                  email: '${data['email']}',
                                ));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 18.0, bottom: 18),
                            child: Material(
                              elevation: 8,
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //   color: Colors.grey,

                                  // ),
                                  color: Color.fromRGBO(226, 232, 240, 1),
                                  // borderRadius: BorderRadius.circular(10),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.grey.withOpacity(0.5),
                                  //     spreadRadius: 3,
                                  //     blurRadius: 2,
                                  //     offset: const Offset(
                                  //         7, 4), // changes position of shadow
                                  //   ),
                                  // ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        '${data['work']}',
                                        fit: BoxFit.cover,
                                        height: 100,
                                        width: 100,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Usage
                                          // Text(
                                          //   '${capitalizeFirstLetter(data['name'])}',
                                          //   style: TextStyle(
                                          //     fontSize: 20,
                                          //     fontWeight: FontWeight.w500,
                                          //     letterSpacing: 1.2,
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${capitalizeFirstLetter(data['title'])}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                letterSpacing: 1.2),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${capitalizeFirstLetter(data['description'])}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1.2),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                  );
                }),
          ),
          Positioned(
            child: FloatingActionButton(
              backgroundColor: white,
              onPressed: () {
                Get.toNamed('/sell');
              },
              child: Icon(
                Icons.add,
                color: black,
              ),
            ),
            bottom: 80,
            //left: 0,
            right: 10,
          ),
          Positioned(
            child: CustomBottomNavigationBar(
              initialIndex: 2,
            ),
            bottom: 0,
            left: 0,
            right: 0,
          )
        ],
      ),
      //floatingActionButton:
    );
  }
}
