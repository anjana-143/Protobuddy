//import 'dart:convert';

import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;



// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
    int initialIndex;
   
  CustomBottomNavigationBar({required this.initialIndex});
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>  {

  void onItemTapped(int index) {
     widget.initialIndex = index;
    // setState(() {
     
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 60,
      // width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(100),
        color: Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Color(0X262525).withOpacity(1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconButton(0, Icons.home, 'Home'),
            buildIconButton(1, Icons.add_box, 'Create'),
            buildIconButton(2, Icons.shopping_cart, 'Cart'),
            buildIconButton(3, Icons.person, 'Profile')
          ],
        ),
      ),
    );
  }
Widget buildIconButton(int index, IconData iconData, String text) {
  return GestureDetector(

       onTap: () {
        onItemTapped(index);
    setState(() {
      widget.initialIndex = index;
    });
        if (index == 0) {
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => animatedDrawer()));
          Navigator.pushNamed(context, '/homepage');
        }
        if (index == 1) {
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => categoryDrawer()));
          Navigator.pushNamed(context,  '/create');
        }
        if (index == 2) {
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => cartdrawer()));
          Navigator.pushNamed(context,  '/buy');
        }
        if(index == 3)
        {
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => supportdrawer()));
                    Navigator.pushNamed(context,  '/profile');

        }
        if(index == 4)
        {
          
        }
      
    },
    child: Container(
      margin: EdgeInsets.only(left: 12,right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // shape: BoxShape.circle,
        color: widget.initialIndex == index
            ? Color.fromRGBO(242, 76, 39, 1)
            : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Icon(
              iconData,
              color: widget.initialIndex==index ? Colors.white : Colors.black, // Set the default color for the icon
            ),
            // Show text based on the selectedIndex
            if (widget.initialIndex == index)
              Text(
                text,
                style: TextStyle(color:widget.initialIndex==index ? Colors.white : Colors.black),
              ),
          ],
        ),
      ),
    ),
  
  
  );
}

}
