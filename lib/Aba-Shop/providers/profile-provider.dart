import 'package:abashop/Aba-Shop/models/profile-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileDataProvider with ChangeNotifier {

  ProfileModel? currentData;
  void getUserData() async {
    ProfileModel profileModel;
    DocumentSnapshot value = await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    //if (value.exists) {
    profileModel = ProfileModel(
      userId: value.get("uuid"),
      fullName: value.get("fullName") ?? "",
      email: value.get("email") ?? "",
      password: value.get("password") ?? "",
      role: value.get("role") ?? "",
      address: value.get("address") ?? "",
    );
    currentData = profileModel;
    notifyListeners();
    //}
  }

  ProfileModel? get currentUserData {
    return currentData;
  }

  Future<void> updateUserData({
    String? userId,
    String? fullName,
    String? email,
    String? address,
    context
  }) async {
    try {
      await FirebaseFirestore.instance.collection("Users").doc(userId).update({
        "uuid": userId,
        "fullName": fullName,
        "email": email,
        "address": address,
      });
    } on FirebaseException catch (e) {
      print('Hata: ${e.message}');
    }
  }

}
