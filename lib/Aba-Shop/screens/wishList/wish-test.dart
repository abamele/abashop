import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/product-model.dart';

class WishTestProvider with ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference products =
      FirebaseFirestore.instance.collection("WishList");

///// Get WishList Data ///////
  List<ProductModel> wishListDataList = [];
  Future<void> getWishListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot productSnapShot = await products.get();
    productSnapShot.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        //product data
        productId: element.get("productId"),
        productImage: element.get("productImage"),
        productDescription: element.get("productDescription"),
        productOriginalPrice: element.get("productOriginalPrice"),
        orderQuantity: 1,
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

  void updateWishList(wishListBool, productId, productImage, productDescription,
      productOriginalPrice, discount, context) {
    if (wishListBool) {
      FirebaseFirestore.instance.collection("WishList").doc(productId).set({
        "productId": productId,
        "productImage": productImage,
        "productDescription": productDescription,
        "productOriginalPrice": productOriginalPrice,
        "discount": discount,
        "isChecked": true,
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Added to my favorite.")));
    } else {
      FirebaseFirestore.instance.collection("WishList").doc(productId).delete();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Remove from my favorite.")));
    }
  }

  ////////// Delete WishList /////
  deleteWishtList(productId, context) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(productId)
        .delete();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Remove from my favorite.")));
    notifyListeners();
  }
}
