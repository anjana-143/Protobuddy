class UserModel {
  String? uid;
  String? email;
  String? fullname;

  String? avatar;
  String? user;

  UserModel({
    this.uid,
    this.email,
    this.fullname,
    this.avatar,
    this.user,
  });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullname: map['fullname'],
      avatar: map['avatar'],
      user: map['user'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullname': fullname,
      'avatar': avatar,
      'user': user,
    };
  }
}
