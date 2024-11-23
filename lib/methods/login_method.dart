// ignore_for_file: use_build_context_synchronously

import 'package:cinema_bono/methods/helper_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<bool> login(BuildContext context,
    {required String email, required String password}) async {
  showloading(context);

  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return true;
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    if (e.code == 'invalid-email') {
      showDialogCustom(context, "The email address is not valid.");
    } else if (e.code == 'invalid-credential') {
      showDialogCustom(context, "The email or password is incorrect.");
    } else {
      showDialogCustom(context, "Something went wrong.Try again later.");
    }
  } catch (e) {
    Navigator.of(context).pop();
    showDialogCustom(context, "e.toString()");
  }
  return false;
}

Future<dynamic> showDialogCustom(BuildContext context, String content) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
              child: Icon(
            Icons.error,
            color: Colors.red,
            size: 50,
          )),
          content: Text(content),
        );
      });
}
