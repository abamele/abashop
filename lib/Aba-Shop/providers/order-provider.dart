import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/product-model.dart';

class OrderProvider with ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;

  String dateAdded = DateFormat('dd/MM/yyyy ').format(DateTime.now());
  String timeAdded = DateFormat('hh:mm:ss').format(DateTime.now());

  // 8 haneli bir sipariş numarası oluşturma fonksiyonu
  String generateOrderNumber() {
    Random random = new Random();
    int numDigits = 8;
    String result = '';

    for (int i = 0; i < numDigits; i++) {
      result += random.nextInt(10).toString();
    }
    return result;
  }

  void addOrderData({
    required String? productId,
    required List<String>? productImage,
    required String? productDescription,
    required num productOriginalPrice,
    required num productDiscountPrice,
    required int productMinOrder,
    required String addresse,
    required num? totalUnit,
    required num total,
  }) {
    FirebaseFirestore.instance
        .collection("Sellers")
        .doc(user?.uid)
        .collection("Products")
        .doc(productId)
        .set({
      "productId": productId,
      "productImage": productImage,
      "productSpecification": productDescription,
      "productOriginalPrice": productOriginalPrice,
      "productDiscountPrice": productDiscountPrice,
      "OrderQuantity": productMinOrder,
      "adresse": addresse,
      "sellerName": "Abdoul-Madjid Attaher",
      "sellerEmail": "a.attaher@outlook.com",
      "sellerPhoneNumber": "+905319453804",
      "orderNumber": generateOrderNumber(),
      "dateAdded": dateAdded,
      "timeAdded": timeAdded,
      "totalUnit": totalUnit,
      "total": total,
      "status": "Have ordered"
    });
  }

  List<ProductModel> orderDataList = [];
  void getOrderData() async {
    List<ProductModel> newList = [];

    QuerySnapshot cartValue = await FirebaseFirestore.instance
        .collection("Sellers")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Products")
        .get();
    cartValue.docs.forEach((element) {
      ProductModel reviewCartModel = ProductModel(
        productImage: List<String>.from(element.get('productImage')),
        productDescription: element.get("productDescription"),
        productOriginalPrice: element.get("productOriginalPrice"),
        orderQuantity: element.get("orderQuantity"),
        addresse: element.get("addresse"),
        sellerName: element.get("sellerName"),
        sellerEmail: element.get("sellerEmail"),
        sellerPhoneNumber: element.get("sellerPhoneNumber"),
        dateAdded: element.get("dateAdded"),
        timeAdded: element.get("timeAdded"),
        status: element.get("status"),
        totalUnit: element.get("totalUnit"),
        total: element.get("total"), isChecked: false,
      );
      newList.add(reviewCartModel);
    });
    orderDataList = newList;
    notifyListeners();
  }

  List<ProductModel> get getOrderDataList {
    return orderDataList;
  }

  int get cartCounter => orderDataList.length;
//// TotalPrice  ///
  getTotalPrice() {
    double total = 0.0;
    orderDataList.forEach((element) {
      total += element.productOriginalPrice * element.orderQuantity;
    });
    return total;
  }
}
