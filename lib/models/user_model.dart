import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String email;
  String username;
  String status;
  int state;
  String profileImageUrl;

  User({
    this.id,
    this.name,
    this.email,
    this.username,
    this.state,
    this.status,
    this.profileImageUrl,
  });

  factory User.fromDoc(DocumentSnapshot doc) {
    return User(
      id: doc.documentID,
      name: doc['name'],
      email: doc['email'],
      state: doc['state'],
      status: doc['status'],
      profileImageUrl: doc['profileImageUrl'],
      username: doc['username'],
    );
  }

// not needed block of code 
  static Map toMap(User user) {
    return {
      "id": user.id,
      "name": user.name,
      "email": user.email,
      "username": user.username,
      "state": user.state,
      "status": user.status,
      "profileImageUrl": user.profileImageUrl,
    };
  }
}
