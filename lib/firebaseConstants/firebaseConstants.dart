import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// so this is the instance of the firebaseAuthentication
FirebaseAuth auth= FirebaseAuth.instance;
// now going to link the firestore
FirebaseFirestore firestore=FirebaseFirestore.instance;

User? currentUser=auth.currentUser;
// we are also going to define the collections
const userCollection="User";
