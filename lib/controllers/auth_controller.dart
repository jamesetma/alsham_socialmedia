import 'package:alsham_socialmedia/views/components/button_builder.dart';
import 'package:alsham_socialmedia/views/pages/personal_info_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController codeController = TextEditingController();
  String? smsCode;

  void phoneSignIn(String phoneNumber, BuildContext context) async {
    await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: ((error) {
          Get.snackbar('authentication error', error.message!);
        }),
        codeSent: ((String verificationId, int? resendToken) async {
          // showModalBottomSheet(
          //   isDismissible: false,
          //   context: context,
          //   builder: ((context) => VerificationBottomsheet(
          //       pinController: pinController)),
          // );
          // // Get.to(() => VerificationPage());
          // PhoneAuthCredential credential =
          //     PhoneAuthProvider.credential(
          //         verificationId: verifcationId,
          //         smsCode: pinController.text.trim());
          // await firebaseAuth.signInWithCredential(credential);
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                    title: const Text("Enter SMS Code"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: codeController,
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      ButtonBuilder(
                        text: 'Done',
                        onPressed: () {
                          smsCode = codeController.text.trim();

                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId,
                                  smsCode: smsCode!);
                          firebaseAuth
                              .signInWithCredential(credential)
                              .then((result) {
                            Get.to(() => PersonalInfoPage());
                          }).catchError((e) {
                            debugPrint(e);
                          });
                        },
                      )
                    ],
                  ));
        }),
        codeAutoRetrievalTimeout: (String verificationId) {});
  }
}
