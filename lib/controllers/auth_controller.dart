import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void phoneSignIn(BuildContext context, String phoneNumber) async {
    firebaseAuth.verifyPhoneNumber(phoneNumber: phoneNumber,verificationCompleted: (PhoneAuthCredential credential)async{await firebaseAuth.signInWithCredential(credential);}, verificationFailed: ((error) {
      Get.snackbar('authentication error',error.message!);
      
    }, codeSent: ((String verifcationId, int? resendToken){}), codeAutoRetrievalTimeout: codeAutoRetrievalTimeout), codeAutoRetrievalTimeout: (String verificationId) {  }, codeSent: (String verificationId, int? forceResendingToken) {  }
  }
}
