import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:protobuddy/database/firebase.dart';
import 'package:protobuddy/models/usermodel.dart';
import 'package:protobuddy/pages/portfolio/create_portfolio.dart';

import 'package:protobuddy/utils/constants.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserModel currentUser = UserModel();
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
    return Container(
      margin: const EdgeInsets.all(8),
      child: ListView(
        children: [
          Column(
            children: [
              CircleAvatar(
                  radius: 70,
                  backgroundColor: grey,
                  backgroundImage: ('${currentUser.avatar}' != 'null')
                      ? NetworkImage('${currentUser.avatar}')
                      : NetworkImage('https://beforeigosolutions.com/wp-content/uploads/2021/12/dummy-profile-pic-300x300-1.png')),
              Text(
                ('${currentUser.fullname}' != 'null')
                    ? '${currentUser.fullname}'
                    : '',
                style: const TextStyle(
                  fontSize: 27,
                  color: black,
                ),
              ),
              Text(
                ('${currentUser.email}' != 'null')
                    ? '${currentUser.email}'
                    : '',
                style: const TextStyle(
                  color: black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(226, 232, 240, 1),
                    borderRadius: BorderRadius.circular(24),
            ),
            margin: const EdgeInsets.only(bottom: 15),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              onTap: () {
                  Get.to( ()=> create_protfolio() );
                            },
              tileColor: white.withOpacity(0.5),
              title: const Text(
                'Create a Portfolio',
                style: TextStyle(
                  color: black ),     
              ),
              trailing: const Icon(
                LineIcons.arrowRight,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                   color: Color.fromRGBO(226, 232, 240, 1),
                    borderRadius: BorderRadius.circular(24),
            ),
            margin: const EdgeInsets.only(bottom: 15),
            child: ListTile(
              
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              onTap: () {
                Get.toNamed('/buy');
              },
              tileColor: white.withOpacity(0.5),
              title: const Text(
                'Buy&Sell',
                style: TextStyle(
                  color: black,
                ),
              ),
              trailing: const Icon(
                LineIcons.arrowRight,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              onTap: () {
                auth.signOut().then((value) {
                  Get.toNamed('/login');
                });
              },
              tileColor: red,
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: black,
                ),
              ),
              trailing: const Icon(
                LineIcons.arrowRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
