import 'dart:math';
import 'package:abashop/Aba-Shop/constants/colors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../components/utils.dart';
import '../../models/product-model.dart';
import '../../providers/cart-provider.dart';
import '../../widgets/bottom-app-bar/bottom-nav-bar.dart';
import '../../widgets/text/text-widget.dart';

class SubmitCart extends StatefulWidget {
  @override
  State<SubmitCart> createState() => _SubmitCartState();
}

class _SubmitCartState extends State<SubmitCart> {
  List<ProductModel> cartDataList = [];
  CartProvider? cartProvider;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerAdresse = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  String productId = "";

  String? newProductId;

  bool _checkbox = false;
  bool _checkAgreement = true;
  bool _checkAgreement2 = true;
  bool _checkAgreement3 = true;
  bool _isLoading = false;

  bool wishList = false;
  num total = 0.0;
  int count = 1;

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

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of<CartProvider>(context);
    cartProvider?.getCartData();
    Size size = Utils(context).screensSize;
    Color color = Utils(context).color;
    getCount() {
      setState(() {
        //count = widget.productModel.orderQuantity;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        elevation: 0.0,
        title: Text("Abashop"),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Center(
                child: Icon(
                  CupertinoIcons.person,
                  size: 30,
                ),
              ),
            ),
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavBar(selectedIndex: 3)));
              ;
            },
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Center(
                child: Icon(
                  CupertinoIcons.heart,
                  size: 30,
                ),
              ),
            ),
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavBar(selectedIndex: 1)));
              ;
            },
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 8.0),
              child: Center(
                child: FlutterBadge(
                  itemCount: cartProvider!.cartCounter,
                  icon: Icon(
                    CupertinoIcons.cart,
                    size: 30,
                  ),
                ),
              ),
            ),
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavBar(selectedIndex: 2)));
              ;
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cartProvider?.cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartProvider?.cartItems[index];
              return Column(
                children: [
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: blueColor,
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          child: FancyShimmerImage(
                            alignment: Alignment.bottomCenter,
                            imageUrl: "${cartItem?.productImage![0]}",
                            width: size.width * 0.3,
                            height: size.height * 0.2,
                            boxFit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, top: 30),
                                child: TextWidget(
                                  text: "${cartItem?.productDescription!}",
                                  color: color,
                                  textSize: 17,
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextWidget(
                                      text: "Size:",
                                      color: color,
                                      textSize: 16,
                                    ),
                                  ),
                                  TextWidget(
                                    text: "${cartItem?.selectedSize}",
                                    color: color,
                                    textSize: 16,
                                    isTile: true,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextWidget(
                                      text: "Quantity:",
                                      color: color,
                                      textSize: 16,
                                    ),
                                  ),
                                  TextWidget(
                                    text: "${cartItem?.orderQuantity}",
                                    color: color,
                                    textSize: 16,
                                    isTile: true,
                                  )
                                ],
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "\$${cartItem?.productOriginalPrice} ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    value: cartItem?.isChecked,
                    onChanged: (value) {
                      cartProvider?.updateCartItem(cartItem!, value!);
                      updateTotalPrice(context, cartProvider!.totalPrice);
                    },
                  ),
                  Divider(
                    thickness: 3,
                  )
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _controllerAdresse,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: 'Address', border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This Field Is Required';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          ListTile(
            leading: Checkbox(
              activeColor: blueColor,
              value: _checkAgreement,
              onChanged: (value) {
                setState(() => _checkAgreement = !_checkAgreement);
              },
            ),
            title: Text("Agree to share Business Card with supplier"),
          ),
          ListTile(
            leading: Checkbox(
              activeColor: blueColor,
              value: _checkAgreement2,
              onChanged: (value) {
                setState(() => _checkAgreement2 = !_checkAgreement2);
              },
            ),
            title: Text(
                "Specify your purchase details and let the supplier know you requirements."),
          ),
          ListTile(
            leading: Checkbox(
              activeColor: blueColor,
              value: _checkAgreement3,
              onChanged: (value) {
                setState(() => _checkAgreement3 = !_checkAgreement3);
              },
            ),
            title: Text(
                "Please make sure your contact information is correct. Your message will be sent directly to the recipient(s) and will not be publicly displayed. Note that if the recipient is a Gold Supplier, they can view your contact information, including your registered email address. Abashop will never distribute or sell your personal information to third parties without your express permission."),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.12,
        child: ListTile(
          title: TextWidget(
            text: "Total Aount",
            color: Colors.black,
            textSize: 18,
            isTile: true,
          ),
          subtitle: TextWidget(
            text: "\$ ${cartProvider?.totalPrice.toStringAsFixed(2)}",
            color: Colors.black,
            textSize: 18,
            isTile: true,
          ),
          trailing: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: MaterialButton(
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Loading...",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              CircularProgressIndicator(
                                color: Colors.white,
                                backgroundColor: Colors.blueAccent,
                              ),
                            ],
                          )
                        : TextWidget(
                            text: "Submit",
                            color: Colors.white,
                            textSize: 17,
                            isTile: true,
                          ),
                  ],
                ),
                color: blueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                onPressed: () async {
                  if (cartProvider!.cartItems.isEmpty) {
                    return;
                    //Fluttertoast.showToast(msg: "No Cart Data Found");
                  } else {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      List<ProductModel> newList = [];
                      QuerySnapshot cartValue = await FirebaseFirestore.instance
                          .collection("Carts")
                          .doc(FirebaseAuth.instance.currentUser?.uid)
                          .collection("YourCarts")
                          .get();
                      Future.delayed(Duration(seconds: 3), () async {
                        cartValue.docs.forEach((element) {
                          ProductModel reviewCartModel = ProductModel(
                            productId: element.get("productId"),
                            productImage: List<String>.from(element.get('productImage')),
                            productDescription:
                                element.get("productDescription"),
                            productOriginalPrice:
                                element.get("productOriginalPrice"),
                            orderQuantity: element.get("orderQuantity"),
                            totalUnit: element.get("totalUnit"),
                            isChecked: false,
                          );
                          newList.add(reviewCartModel);
                        });
                        cartDataList = newList;

                        cartDataList.forEach((products) async {
                          await FirebaseFirestore.instance
                              .collection("Sellers")
                              .doc(user?.uid)
                              .collection("Products")
                              .add({
                            "productImage": products.productImage,
                            "productDescription": products.productDescription,
                            "productOriginalPrice":
                                products.productOriginalPrice,
                            "orderQuantity": products.orderQuantity,
                            "addresse": _controllerAdresse.text,
                            "sellerName": "Aba Mele",
                            "sellerEmail": "abamele90@gmail.com",
                            "sellerPhoneNumber": "+905466716860",
                            "orderNumber": generateOrderNumber(),
                            "dateAdded": dateAdded,
                            "timeAdded": timeAdded,
                            "totalUnit": products.totalUnit,
                            "total": cartProvider?.totalPrice,
                            "status": "Have ordered"
                          }).then((value) => Navigator.pushNamedAndRemoveUntil(
                                  context, "/my-order", (route) => false));
                        });
                        _isLoading = false;
                        // Sepeti temizle
                        // Sepet belgelerini sil
                        await Future.wait(cartValue.docs
                            .map((doc) => doc.reference.delete()));
                      });
                    }
                  }
                }),
          ),
        ),
      ),
    );
  }

  void updateTotalPrice(BuildContext context, double totalPrice) async {
    CollectionReference cartCollection =
        FirebaseFirestore.instance.collection('cart');
    QuerySnapshot snapshot = await cartCollection.get();

    if (snapshot.docs.isNotEmpty) {
      DocumentSnapshot doc = snapshot.docs.first;
      await cartCollection.doc(doc.id).update({'totalPrice': totalPrice});
    } else {
      await cartCollection.add({'totalPrice': totalPrice});
    }
  }
}
