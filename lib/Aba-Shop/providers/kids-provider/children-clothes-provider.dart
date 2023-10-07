import 'package:abashop/Aba-Shop/models/product-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ChildrenClothesProvider with ChangeNotifier {

  List<ProductModel> childrenClothesDataList = [];
  void getChildrenClothesData() async {
    List<ProductModel> newList = [];

    QuerySnapshot reviewChildrenClothesValue =
    await FirebaseFirestore.instance.collection("ChildrenClothes").get();
    reviewChildrenClothesValue.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        //product data
        productId: element.get("productId"),
        productImage: List<String>.from(element.get('productImage')),
        productDescription: element.get("productDescription"),
        productOriginalPrice: element.get("productOriginalPrice"),
        discount: element.get("discount"),
        orderQuantity: element.get("OrderQuantity"),

        //waist: element.get("waist"),
        tissue_type: element.get("tissue_type"),

        color: element.get("color"),
        //thickness: element.get("thickness"),
        //collarType: element.get("collarType"),
        //armLenght: element.get("armLenght"),
        //style: element.get("style"),
        //mold: element.get("mold"),
        pattern: element.get("pattern"),
        //collection: element.get("collection"),
        //sustainableDetail: element.get("sustainableDetail"),
        isChecked: false,
      );
      newList.add(productModel);
    });
    childrenClothesDataList = newList;
    notifyListeners();
  }

  List<ProductModel> get getChildrenClothesDataList {
    return childrenClothesDataList;
  }

  ////////////// BagAddFunction ////////////
  void addChildrenClothesData({
    String? productId,
    List<String>? productImage,
    String? productSpecification,
    int? productPrice,
    String? minOrder,
    var cartUnit,
  }) async {
    FirebaseFirestore.instance
        .collection("ChildrenClothes")
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

  ////////////// BagUpdateFunction ////////////
  void updateChildrenClothesData({
    String? productId,
    List<String>? productImage,
    String? productSpecification,
    int? productPrice,
    int? productWieght,
  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(productId)
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

  ////////////// BagDeleteFunction ////////////
  childrenClothesDelete(cartId) {
    FirebaseFirestore.instance
        .collection("ChildrenClothes")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
