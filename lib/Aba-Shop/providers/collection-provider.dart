import 'package:abashop/Aba-Shop/models/product-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CollectionProvider with ChangeNotifier {

  List<ProductModel> collectionDataList = [];
  void getCollectionData() async {
    List<ProductModel> newList = [];

    QuerySnapshot reviewCollectionValue =
    await FirebaseFirestore.instance.collection("NewCollection").get();
    reviewCollectionValue.docs.forEach((element) {
      ProductModel collectionModel = ProductModel(
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
      newList.add(collectionModel);
    });
    collectionDataList = newList;
    notifyListeners();
  }

  List<ProductModel> get getCollectionDataList {
    return collectionDataList;
  }

  ////////////// BeverageAddFunction ////////////
  void addCollectionData({
    String? productId,
    List<String>? productImage,
    String? productDescription,
    int? productPrice,
    String? minOrder,
    var cartUnit,
  }) async {
    FirebaseFirestore.instance
        .collection("NewCollection")
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
  void updateCollectionData({
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
        "productImage": productImage,
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
        .collection("Collection")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
