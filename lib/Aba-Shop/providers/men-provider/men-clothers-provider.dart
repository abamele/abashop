import 'package:abashop/Aba-Shop/models/product-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class MenClothersProvider with ChangeNotifier {

  List<ProductModel> menClotherDataList = [];
  void getMenClothersData() async {
    List<ProductModel> newList = [];

    QuerySnapshot reviewMenClothersValue =
    await FirebaseFirestore.instance.collection("MenClothers").get();
    reviewMenClothersValue.docs.forEach((element) {
      ProductModel clotherModel = ProductModel(
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
      newList.add(clotherModel);
    });
    menClotherDataList = newList;
    notifyListeners();
  }

  List<ProductModel> get getMenClothersDataList {
    return menClotherDataList;
  }

  ////////////// ClothersAddFunction ////////////
  void addMenClothersData({
    String? productId,
    List<String>? productImage,
    String? productSpecification,
    int? productPrice,
    String? minOrder,
    var cartUnit,
  }) async {
    FirebaseFirestore.instance
        .collection("MenClothers")
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

  ////////////// ClothersUpdateFunction ////////////
  void updateMenClothersData({
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

  ////////////// ClothersDeleteFunction ////////////
  menClohtersDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("MenClothers")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
