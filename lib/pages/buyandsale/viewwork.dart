import 'package:flutter/material.dart';
import 'package:protobuddy/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ViewWork extends StatelessWidget {
  ViewWork({
    super.key,
    required this.work,
    required this.email,
  });
  late String work;
  late String email;
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
        ),
        backgroundColor: Colors.white,

        centerTitle: true,
        title: Text('Buy This Work', style: TextStyle(color: black)) ,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(
              12,
            ),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(work),
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
              ),
            ),
          ),
          StatefulBuilder(
            builder: (BuildContext context, setState) {
              return MaterialButton(
                onPressed: () {
                  setState(() {
                    launchUrl(Uri.parse('mailto:' +
                        '$email' +
                        '?subject=Buy Work Posted on Protobuddy&body=Hello! \n I loved the work you have posted on protobuddy and I would love to buy your work!'));
                  });
                },
                color: red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Buy Work',
                    style: TextStyle(
                      color: white,
                      fontSize: 19,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
