import 'package:abashop/Aba-Shop/models/product-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


class AllProductProvider with ChangeNotifier {

  List<ProductModel> allProductDataList = [];
  void getAllProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot reviewAllProductValue =
    await FirebaseFirestore.instance.collection("AllProduct").get();
    reviewAllProductValue.docs.forEach((element) {
      ProductModel allProductModel = ProductModel(
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
      newList.add(allProductModel);
    });
    allProductDataList = newList;
    notifyListeners();
  }

  List<ProductModel> get getAllProductDataList {
    return allProductDataList;
  }

  ////////////// BeverageAddFunction ////////////
  void addAllProductData({
    String? productId,
    List<String>? productImage,
    String? productDescription,
    int? productPrice,
    String? minOrder,
    var cartUnit,
  }) async {
    FirebaseFirestore.instance
        .collection("AllProduct")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(productId)
        .set(
      {
        "productId": productId,
        "productImage": productImage,
        "productDescription": productDescription,
        "productPrice": productPrice,
        "productMinOrder": minOrder,
      },
    );
  }

  ////////////// BeverageUpdateFunction ////////////
  void updateAllProductData({
    String? productId,
    List<String>? productImage,
    String? productDescription,
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
        "productDescription": productDescription,
        "cartPrice": productPrice,
        "cartQuantity": productWieght,
        "isAdd": true,
      },
    );
  }

  ////////////// BeverageDeleteFunction ////////////
  NewSeasonDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("New Season")
        .doc(FirebaseAuth.instance.currentUser?.uid)
    //.collection("YourReviewCart")
    //.doc(cartId)
        .delete();
    notifyListeners();
  }
}
