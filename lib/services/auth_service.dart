import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:threads_clone/models/user_model.dart';
import 'package:threads_clone/services/storage_service.dart';

class AuthMethods {
  //create a firebase auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //register new user
  Future<String> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List profilePic,
  }) async {
    String res = "Some error occurred";

    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          userName.isNotEmpty &&
          bio.isNotEmpty &&
          profilePic.isNotEmpty) {
        //register a new user

        final UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        //upload the profile picture to firebase storage
        String photoURL = await StorageMethods().uploadImage(
          folderName: "ProfileImages",
          isPost: false,
          file: profilePic,
        );

        UserModel user = UserModel(
          uid: _auth.currentUser!.uid,
          email: email,
          userName: userName,
          bio: bio,
          profilePic: photoURL,
          followers: [],
          following: [],
        );

        if (userCredential.user != null) {
          //add the user to the database
          await _firestore
              .collection("users")
              .doc(_auth.currentUser!.uid)
              .set(user.toJson());

          res = "success";
        }
        // } else {
        //   res = "Please enter all the fields";
      }

      //catch the errors extra error handling
    } on FirebaseAuthException catch (err) {
      if (err.code == "weak-password") {
        res = "Password is too weak";
      } else if (err.code == "email-already-in-use") {
        res = "Email already in use";
      } else if (err.code == "invalid-email") {
        res = "Email is invalid";
      } else if (err.code == "operation-not-allowed") {
        res = "Operation not allowed";
      } else if (err.code == "user-disabled") {
        res = "User disabled";
      } else if (err.code == "user-not-found") {
        res = "User not found";
      } else if (err.code == "wrong-password") {
        res = "Wrong password";
      } else {
        res = err.toString();
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
