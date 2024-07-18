import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class AuthMethod {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;


  Future<String> signupUser({
    required String email,
    required String password,
    required String name,
  }) async {
    String finalResponse = "";
    try {
      if (email.isNotEmpty || password.isNotEmpty || name.isNotEmpty) {

        UserCredential cred = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await fireStore.collection("users").doc(cred.user!.uid).set({
          'name': name,
          'uid': cred.user!.uid,
          'email': email,
        });

        finalResponse = "success";
      }
    } catch (err) {
      return err.toString();
    }
    return finalResponse;
  }

  // Login
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    late String uid;
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        uid = user.uid;
      }

    } catch (err) {

      final responseData =  {
        "status": "error",
        "uid": uid,
      };
      return json.encode(responseData);
    }

    final responseData =  {
      "status": "success",
      "uid": uid,
    };


    return json.encode(responseData);
  }

  // signOut
  signOut() async {
    await auth.signOut();
  }
}
