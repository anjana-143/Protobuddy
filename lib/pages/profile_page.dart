import 'package:flutter/material.dart';
import 'package:protobuddy/buttonnavbar/CustomBottomNavigationBar.dart';
import 'package:protobuddy/database/firebase.dart';
import 'package:protobuddy/models/usermodel.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();

class _ProfileState extends State<Profile> {
  late UserModel currentUser = UserModel();
  bool _isEditing = false;
  

  @override
  void initState() {
    super.initState();
    fetchUserData();
 //   _nameController = TextEditingController();
   // _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void fetchUserData() async {
    var userData =
        await firestore.collection("protobuddy").doc(auth.currentUser!.uid).get();
    setState(() {
      currentUser = UserModel.fromMap(userData.data()!);
      _nameController.text = currentUser.fullname ?? '';
      _emailController.text = currentUser.email ?? '';
    });
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() async {
    try {
      // Update the user's information in Firestore
      await firestore.collection("protobuddy").doc(auth.currentUser!.uid).update({
        'fullname': _nameController.text,
        'email': _emailController.text,
      });

      // Fetch updated user data from Firestore
      var userData = await firestore.collection("protobuddy").doc(auth.currentUser!.uid).get();
      if (userData.exists) {
        setState(() {
          currentUser = UserModel.fromMap(userData.data()!);
          _nameController.text = currentUser.fullname ?? '';
          _emailController.text = currentUser.email ?? '';
                  print('User data updated successfully: ${currentUser.fullname}');

        });
      } else {
        // Handle case where user data is not found
        print('User data not found after update');
      }

      // After saving, toggle back to view mode
      _toggleEdit();
    } catch (e) {
      // Handle Firestore update error
      print('Error updating user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF2196F3),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                currentUser.avatar ?? 'https://beforeigosolutions.com/wp-content/uploads/2021/12/dummy-profile-pic-300x300-1.png',
              ),
            ),
            SizedBox(height: 40),
            Text(
              'My Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2196F3)),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 20, color: Color(0xFF2196F3), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _isEditing
                      ? TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        )
                      : Text(
                          currentUser.fullname ?? '',
                          style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                        ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 20, color: Color(0xFF2196F3), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _isEditing
                      ? TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        )
                      : Text(
                          currentUser.email ?? '',
                          style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                        ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _isEditing
                ? ElevatedButton(
                    onPressed: () {
                       _saveChanges();
                       setState(() {
                        _nameController.text = currentUser.fullname ?? '';
                       _emailController.text = currentUser.email ?? '';
                      });
                    },
                    child: Text('Save'),
                  )
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _toggleEdit();
                      });
                    },
                    child: Text('Edit'),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(initialIndex: 3),
    );
  }
}
