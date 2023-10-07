import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product-model.dart';

class WishListProvider with ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference products =
  FirebaseFirestore.instance.collection("newSeason");


///// Get WishList Data ///////
  List<ProductModel> wishListDataList = [];
  Future<void> getWishListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot productSnapShot =
    await products.where('WishList', arrayContains: user?.uid).get();
    productSnapShot.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        //product data
        productId: element.get("productId"),
        productImage: List<String>.from(element.get('productImage')),
        productDescription: element.get("productDescription"),
        productOriginalPrice: element.get("productOriginalPrice"),
        orderQuantity: element.get("OrderQuantity"),
        discount: element.get("discount"),
         isChecked: false,
      );
      newList.add(productModel);
    });
    wishListDataList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishListDataList {
    return wishListDataList;
  }

  int get favCounter => wishListDataList.length;


////////// Delete WishList /////
  deleteWishtList(wishListId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .delete();
    notifyListeners();
  }

  void updateWishList(wishListBool, productId, context) {
    if (wishListBool) {
      FirebaseFirestore.instance.collection("newSeason").doc(productId).update({
        "WishList": FieldValue.arrayUnion([user?.uid])
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Added to my favorite.")));
    } else {
      FirebaseFirestore.instance.collection("newSeason").doc(productId).update({
        "WishList": FieldValue.arrayRemove([user?.uid])
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Remove from my favorite.")));
    }
  }

  ////////////// wishListDeleteFunction ////////////
  wishDataDelete(productId, context) {
    FirebaseFirestore.instance.collection("newSeason").doc(productId).update({
      "WishList": FieldValue.arrayRemove([user?.uid])
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Remove from my favorite.")));
    notifyListeners();
  }
}
