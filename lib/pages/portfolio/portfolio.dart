import 'package:flutter/material.dart';
import 'package:protobuddy/utils/constants.dart';

// ignore: must_be_immutable
class PortfolioDetail extends StatelessWidget {
  PortfolioDetail({
    super.key,
    required this.avatar,
    required this.description,
    required this.education,
    required this.email,
    required this.experience,
    required this.name,
    required this.speciality,
    required this.work,
    required this.title,
    required this.address,
  });

  late String avatar;
  late String name;
  late String email;
  late String speciality;
  late String experience;
  late String education;
  late String work;
  late String description;
  late String title;
  late String address;

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
        title: Text(
          'Portfolio',
          style: TextStyle(
            color: black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage('$avatar'),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1.5,
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(226, 232, 240, 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Container(
                // height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(226, 232, 240, 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Description',
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2),
                      ),
                      Divider(
                        color: black,
                        thickness: 1,
                      ),
                      Text(
                        description,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(226, 232, 240, 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Education',
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2),
                      ),
                      Divider(
                        color: black,
                        thickness: 1,
                      ),
                      Text(
                        education,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(226, 232, 240, 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Experience',
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2),
                      ),
                      Divider(
                        color: black,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Text(
                            experience,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //Text(
                           // 'From', //start tear 
                          //  style: TextStyle(
                          //      color: Colors.black,
                            //    fontSize: 16,
                              //  fontWeight: FontWeight.w400,
                                //letterSpacing: 1.2),
                          //),
                          //SizedBox(
                            //width: 10,
                          //),
                          //Text(
                            //'To',//end year
                            //style: TextStyle(
                              //  color: Colors.black,
                                //fontSize: 16,
                                //fontWeight: FontWeight.w400,
                                //letterSpacing: 1.2),
                          //),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Container(
                // height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(226, 232, 240, 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Work Title',
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2),
                      ),
                      Divider(
                        color: black,
                        thickness: 1,
                      ),
                      Text(
                        speciality,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Container(
                // height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(226, 232, 240, 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Works',
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2),
                      ),
                      Divider(
                        color: black,
                        thickness: 1,
                      ),
                      Image.network(
                        work,
                        fit: BoxFit.fitHeight,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28.0),
              child: Container(
                // height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(226, 232, 240, 1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Info',
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2),
                      ),
                      Divider(
                        color: black,
                        thickness: 1,
                      ),
                      Text(
                        address,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
      // body: Container(
      //   color: Colors.black,
      //   margin: const EdgeInsets.all(
      //     12,
      //   ),
      //   child: SingleChildScrollView(
      //     scrollDirection: Axis.vertical,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Container(
      //           width: double.infinity,
      //           decoration: BoxDecoration(
      //             color: white,
      //             borderRadius: BorderRadius.circular(24),
      //           ),
      //           child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(24),
      //             ),
      //             child: AspectRatio(
      //               aspectRatio: 16 / 9,
      //               child: Container(
      //                 margin: EdgeInsets.all(15),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Container(
      //                       width: MediaQuery.of(context).size.width / 2,
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text(
      //                             name,
      //                             style: TextStyle(
      //                               fontSize: 21,
      //                               fontWeight: FontWeight.w500,
      //                             ),
      //                           ),
      //                           Text(
      //                             email,
      //                             style: TextStyle(
      //                               fontSize: 17,
      //                             ),
      //                           ),
      //                           Text(
      //                             address,
      //                             style: TextStyle(
      //                               fontSize: 17,
      //                             ),
      //                           ),
      //                           Text(
      //                             speciality,
      //                             style: TextStyle(
      //                               fontSize: 17,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     Container(
      //                       width: MediaQuery.of(context).size.width / 3,
      //                       decoration: BoxDecoration(
      //                         image: DecorationImage(
      //                           fit: BoxFit.fitWidth,
      //                           image: NetworkImage('$avatar'),
      //                         ),
      //                         borderRadius: BorderRadius.circular(24),
      //                       ),
      //                       child: AspectRatio(
      //                         aspectRatio: 1 / 2,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 50,
      //         ),
      //         Row(
      //           children: [
      //             Text(
      //               'Education: ',
      //               style: TextStyle(
      //                 fontSize: 21,
      //                 color: white,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //             Text(
      //               education,
      //               style: TextStyle(
      //                 color: white,
      //                 fontSize: 17,
      //               ),
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 25,
      //         ),
      //         Row(
      //           children: [
      //             Text(
      //               'Experience: ',
      //               style: TextStyle(
      //                 fontSize: 21,
      //                 color: white,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //             Text(
      //               experience,
      //               style: TextStyle(
      //                 color: white,
      //                 fontSize: 17,
      //               ),
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 25,
      //         ),
      //         Text(
      //           'Works',
      //           style: TextStyle(
      //             fontSize: 21,
      //             color: white,
      //             fontWeight: FontWeight.w500,
      //           ),
      //         ),
      //         SizedBox(
      //           height: 15,
      //         ),
      //         Text(
      //           title,
      //           style: TextStyle(
      //             fontSize: 19,
      //             color: white,
      //           ),
      //         ),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Container(
      //           decoration: BoxDecoration(
      //             image: DecorationImage(
      //               fit: BoxFit.fill,
      //               image: NetworkImage('$work'),
      //             ),
      //             borderRadius: BorderRadius.circular(24),
      //           ),
      //           child: AspectRatio(
      //             aspectRatio: 16 / 9,
      //           ),
      //         ),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text(
      //           description,
      //           style: TextStyle(
      //             color: white,
      //             fontSize: 17,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
