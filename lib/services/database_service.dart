import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skype/models/user_model.dart';
import 'package:skype/utilities/constants.dart';

class DatabaseService{


 static Future<bool> checkIfCredentialIsWithinDB(FirebaseUser user) async{
  DocumentSnapshot userSnapshot = await usersRef.document(user.uid).get();
  return userSnapshot.exists;

}

static Future<void> addUser(FirebaseUser user)async{
  
  usersRef.document(user.uid).setData({
    
    "name": user.displayName,
      "email": user.email,
      "username": "live ${user.email.split("@")[0]}",
      "state": "",
      "status": "",
      "profileImageUrl": user.photoUrl,

  });
}


}