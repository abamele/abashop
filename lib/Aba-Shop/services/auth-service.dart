import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/user-model.dart';
import '../providers/user-provider.dart';
import '../screens/signin/signin-page.dart';


class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;

  /*void toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      gravity: ToastGravity.BOTTOM,
    );
  }*/

  // login
  Future<void> login(
      Users users, AuthNotifier authNotifier, BuildContext context) async {
    try {
      UserCredential? result;
      result = await auth.signInWithEmailAndPassword(
          email: users.email.toString().trim(),
          password: users.password.toString().trim());

      if (result != null) {
        User? user = auth.currentUser;
        // check email verification
        if (user!.emailVerified) {
          print('Logged In: $user');
          authNotifier.setUser(user);
          await getUserDetails(authNotifier, context);

          if (user.email == "abamele20@gmail.com") {
            Navigator.pushNamedAndRemoveUntil(
                context, "/admin", (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, "/home", (route) => false);
          }
        } else {
          auth.signOut();
          //toast('Email ID not Verified');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: yellowColor,
              content: Text(
                'Email ID not Verified',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      //toast(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: crimsonColor,
          content: Text(
            "${e.message}",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      /*showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text("${e.message}"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );*/
    }
  }

  // sign up
  Future<void> signup(
      Users users, AuthNotifier authNotifier, BuildContext context) async {
    UserCredential? result;
    bool userDataUploaded = false;

    try {
      result = await auth.createUserWithEmailAndPassword(
          email: users.email.toString().trim(),
          password: users.password.toString().trim());
    } catch (e) {
      //toast(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: crimsonColor,
          content: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    try {
      if (result != null) {
        //await auth.currentUser?.updateProfile(displayName: users.firstName);
        //await auth.currentUser?.updateProfile(displayName: users.lastName);
        User? user = result.user;
        await user?.sendEmailVerification();

        if (user != null) {
          await user.reload();
          print("Sign up: $user");

          //uploadUserData(users, userDataUploaded);
          bool userDataUploadVar = userDataUploaded;

          User? currentUser = auth.currentUser;
          users.uuid = currentUser!.uid;
          if (userDataUploadVar != true) {
            await FirebaseFirestore.instance
                .collection('Users')
                .doc(users.uuid)
                .set(users.toMap())
                .catchError((e) => print(e))
                .then((value) => userDataUploadVar = true);
          }
          await auth.signOut();
          authNotifier.setUser(null);
          //Create an instance of ProgressDialog
          //toast('Verification link is sent to ${user.email}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kPrimaryColor,
              content: Text(
                'Verification link is sent to ${user.email}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
          await Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        }
      }
    } catch (e) {
      //toast(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: crimsonColor,
          content: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  // to upload user data
  Future<void> uploadUserData(Users users, bool userDataUploaded) async {
    bool userDataUploadVar = userDataUploaded;

    User? currentUser = auth.currentUser;
    users.uuid = currentUser!.uid;

    CollectionReference userRef =
    FirebaseFirestore.instance.collection('Users');

    // check data uploaded or not
    if (userDataUploadVar != true) {
      await userRef
          .doc(currentUser.uid)
          .set(users.toMap())
          .catchError((e) => print(e))
          .then((value) => userDataUploadVar = true);
    }
  }

  // to get user details
  Future<void> getUserDetails(AuthNotifier authNotifier, context) async {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(authNotifier.user?.uid)
        .get()
        .catchError((e) => print(e));
  }

  // initialize current user
  Future<void> initializeCurrentUser(AuthNotifier authNotifier, context) async {
    User? user = auth.currentUser;

    if (user != null) {
      authNotifier.setUser(user);
      await getUserDetails(authNotifier, context);
    }
  }

  // signout
  Future<void> signOut(BuildContext context) async {
    await auth.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
