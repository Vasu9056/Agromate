import 'package:agromate/const/firebase_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthservices extends GetxController {
  var isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;

//signup method
  Future<User?> signupWithEmailandPassword(
      String email, String Password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: Password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

//signin method

  Future<User?> signInWithEmailAndPassword(
      String email, String Password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: Password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  //google signin
  Future<UserCredential?> signInwithgoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//store user data
  Future<User?> storeuserdata({
    name,
    password,
    email,
  }) async {
    DocumentReference store =
        await firestore.collection(usercollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
    });
  }
}
