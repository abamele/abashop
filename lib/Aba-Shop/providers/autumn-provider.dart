import 'package:abashop/Aba-Shop/models/product-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AutumnProvider with ChangeNotifier {

  List<ProductModel> autumnDataList = [];
  void getAutumnData() async {
    List<ProductModel> newList = [];

    QuerySnapshot reviewAutumnValue =
    await FirebaseFirestore.instance.collection("Autumn").get();
    reviewAutumnValue.docs.forEach((element) {
      ProductModel autumnModel = ProductModel(
        //product data
        productId: element.get("productId"),
        productImage: List<String>.from(element.get('productImage')),
        productDescription: element.get("productDescription"),
        productOriginalPrice: element.get("productOriginalPrice"),
        discount: element.get("discount"),
        orderQuantity: element.get("orderQuantity"),

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
      newList.add(autumnModel);
    });
    autumnDataList = newList;
    notifyListeners();
  }

  List<ProductModel> get getAutumnDataList {
    return autumnDataList;
  }

  ////////////// BeverageAddFunction ////////////
  void addAutumnData({
    String? productId,
    List<String>? productImage,
    String? productSpecification,
    int? productPrice,
    String? minOrder,
    var cartUnit,
  }) async {
    FirebaseFirestore.instance
        .collection("Autumn")
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
  void updateAutumnData({
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
        "productImage": productImage,
        "productSpecification": productSpecification,
        "cartPrice": productPrice,
        "cartQuantity": productWieght,
        "isAdd": true,
      },
    );
  }

  ////////////// BeverageDeleteFunction ////////////
  NewSeasonDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("Autumn")
        .doc(FirebaseAuth.instance.currentUser?.uid)
     .collection("YourReviewCart")
     .doc(cartId)
        .delete();
    notifyListeners();
  }
}
