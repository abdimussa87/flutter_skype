import 'package:cloud_firestore/cloud_firestore.dart';

Firestore _firestore = Firestore.instance;

final usersRef = _firestore.collection("users");