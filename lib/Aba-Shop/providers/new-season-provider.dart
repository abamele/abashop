import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/product-model.dart';

class NewSeasonProvider with ChangeNotifier {

  List<ProductModel> newSeasonDataList = [];
  void getNewSeasonData() async {
    List<ProductModel> newList = [];

    QuerySnapshot reviewNewSeasonValue =
        await FirebaseFirestore.instance.collection("newSeason").get();
    reviewNewSeasonValue.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        //product data
        productId: element.get("productId"),
        productImage: List<String>.from(element.get('productImage')),
        productDescription: element.get("productDescription"),
        productOriginalPrice: element.get("productOriginalPrice"),
        discount: element.get("discount"),
        orderQuantity: element.get("OrderQuantity"),

        waist: element.get("waist"),
        tissue_type: element.get("tissue_type"),

        color: element.get("color"),
        thickness: element.get("thickness"),
        collarType: element.get("collarType"),
        armLenght: element.get("armLenght"),
        style: element.get("style"),
        mold: element.get("mold"),
        pattern: element.get("pattern"),
        collection: element.get("collection"),
        sustainableDetail: element.get("sustainableDetail"),
         isChecked: false,
      );
      newList.add(productModel);
    });
    newSeasonDataList = newList;
    notifyListeners();
  }

  List<ProductModel> get getNewSeasonProductDataList {
    return newSeasonDataList;
  }

  ////////////// BeverageAddFunction ////////////
  void addNewSeasonData({
    String? productId,
    List<String>? productImage,
    String? productSpecification,
    int? productPrice,
    String? minOrder,
    var cartUnit,
  }) async {
    FirebaseFirestore.instance
        .collection("newSeason")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(productId)
        .set(
      {
        "productId": productId,
        "productImage": productImage,
        "productSpecification": productSpecification,
        "productPrice": productPrice,
        "productMinOrder": minOrder,
      },
    );
  }

  ////////////// BeverageUpdateFunction ////////////
  void updateNewSeasonData({
    String? productId,
    List<String>? productImage,
    String? productSpecification,
    int? productPrice,
    int? productWieght,
  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        //.collection("YourReviewCart")
        //.doc(productId)
        .update(
      {
        "cartId": productId,
        "cartName": productImage,
        "cartImage": productSpecification,
        "cartPrice": productPrice,
        "cartQuantity": productWieght,
        "isAdd": true,
      },
    );
  }

  ////////////// BeverageDeleteFunction ////////////
  NewSeasonDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("NewSeason")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        //.collection("YourReviewCart")
        //.doc(cartId)
        .delete();
    notifyListeners();
  }
}
