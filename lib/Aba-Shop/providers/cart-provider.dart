import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/product-model.dart';

class CartProvider with ChangeNotifier {
  List<ProductModel> _cartItems = [];
  bool _isCartEmpty = true;

  void getCartData() async {
    List<ProductModel> newList = [];
    try {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        QuerySnapshot cartValue = await FirebaseFirestore.instance
            .collection("Carts")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .collection("YourCarts")
            .get();
        cartValue.docs.forEach((element) {
          ProductModel reviewCartModel = ProductModel(
            productId: element.get("productId"),
            productImage: List<String>.from(element.get('productImage')),
            productDescription: element.get("productDescription"),
            selectedSize: element.get("selectedSize"),
            productOriginalPrice: element.get("productOriginalPrice"),
            orderQuantity: element.get("orderQuantity"),
            totalUnit: element.get("totalUnit"),
            isChecked: element.get("isChecked"),
          );
          newList.add(reviewCartModel);
        });
        _cartItems = newList;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      print('Hata: ${e.message}');
    }
  }
  List<ProductModel> get cartItems => _cartItems;

  int get cartCounter => cartItems.length;
  bool get isCartEmpty => _isCartEmpty;

  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      if (item.isChecked) {
        total += item.totalPrice;
      }
    }
    return total;
  }

  User? user = FirebaseAuth.instance.currentUser;

  void addCartData({
    required String? productId,
    required List<String>? productImage,
    required String? productDescription,
    required num productOriginalPrice,
    required num? totalUnit,
    required int orderQte,
    required String selectedSize,
    required bool isChecked,
  }) async {
    try {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        final newCartRef = FirebaseFirestore.instance
            .collection("Carts")
            .doc(user?.uid)
            .collection("YourCarts")
            .doc(productId);

        transaction.set(newCartRef, {
          "productId": productId,
          "productImage": productImage,
          "productDescription": productDescription,
          "productOriginalPrice": productOriginalPrice,
          "orderQuantity": orderQte,
          "selectedSize": selectedSize,
          "totalUnit": totalUnit,
          "isChecked": isChecked,
        });
        final newCartId = newCartRef.id;
        print('Yeni cart eklendi. Cart ID: $newCartId');
      });
    } on FirebaseAuthException catch (e) {
      print('Hata: ${e.message}');
    }
  }

  void addToCart(ProductModel item) {
    _cartItems.add(item);
    _isCartEmpty = false;
    notifyListeners();
  }

  void removeFromCart(ProductModel item) {
    _cartItems.remove(item);
    if (_cartItems.isEmpty) {
      _isCartEmpty = true;
    }
    notifyListeners();
  }

  void updateCartData({
    String? productId,
    String? productDescription,
    List<String>? productImage,
    required num productOriginalPrice,
    required int productMinOrder,
    required num totalUnit,
  }) async {
    try {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        final cartRef = FirebaseFirestore.instance
            .collection("Carts")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .collection("YourCarts")
            .doc(productId);

        transaction.update(cartRef, {
          "productId": productId,
          "productImage": productImage,
          "productDescription": productDescription,
          "productPrice": productOriginalPrice,
          "orderQuantity": productMinOrder,
          "totalUnit": totalUnit,
          "isAdd": true,
        });
      });
    } on FirebaseAuthException catch (e) {
      print('Hata: ${e.message}');
    }
  }

  void updateCartItem(ProductModel item, bool isChecked) async{
    item.isChecked = isChecked;
    print(item.isChecked);
    try {
      await FirebaseFirestore.instance
          .collection("Carts")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection("YourCarts")
          .doc(item.productId) // ProductModel'e özgü belgeyi hedefleyin
          .update({"isChecked": isChecked});
      print("isChecked: ${item.isChecked}");
      notifyListeners();
    } catch (e) {
      print("Hata: $e");
    }
  }
  getTotalPrice() {
    num total = 0.0;
    cartItems.forEach((element) {
      total += element.productOriginalPrice * element.orderQuantity;
    });
    return total;
  }

  sumCart() {
    return cartItems.length == 0
        ? 0.0
        : cartItems
            .map((e) => e.productOriginalPrice * e.orderQuantity)
            .reduce((value, element) => value + element);
  }

////////////// ReviCartDeleteFunction ////////////
  cartDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("Carts")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourCarts")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
