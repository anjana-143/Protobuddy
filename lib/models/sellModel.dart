class SellModel {
  String? uid;
  String? title;
  String? category;
  String? description;
  String? work;
  String? email;

  SellModel({
    this.uid,
    this.title,
    this.category,
    this.description,
    this.work,
    this.email,
  });

  // receiving data from server
  factory SellModel.fromMap(map) {
    return SellModel(
      uid: map['uid'],
      title: map['title'],
      category: map['category'],
      description: map['description'],
      work: map['work'],
      email: map['email'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'category': category,
      'description': description,
      'work': work,
      'email': email,
    };
  }
}
