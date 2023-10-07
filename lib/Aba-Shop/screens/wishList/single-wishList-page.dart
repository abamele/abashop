import 'package:abashop/Aba-Shop/constants/context-extension.dart';
import 'package:abashop/Aba-Shop/models/product-model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../providers/cart-provider.dart';
import '../carts/cart-page.dart';
import '../new-seasons/new-season-details.dart';

class SingleWishList extends StatefulWidget {
  SingleWishList({super.key, required this.productModel, required this.onDelete});
  ProductModel productModel;
  Function onDelete;
  @override
  State<SingleWishList> createState() => _SingleWishListState();
}

class _SingleWishListState extends State<SingleWishList> {
  bool _isLoading = false;
  double rating = 3.5;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProd = Provider.of(context);
    cartProd.getCartData();
    List<Widget> _starList = [];
    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        _starList.add(Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ));
      } else if (i == realNumber) {
        _starList.add(SizedBox(
            width: 18,
            height: 18,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),
                ClipRect(
                  clipper: _Clipper(part: partNumber),
                  child: Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 18,
                  ),
                )
              ],
            )));
      } else {
        _starList.add(Icon(
          Icons.star,
          color: Colors.grey,
          size: 18,
        ));
      }
    }

    return GestureDetector(
      child: Container(
        width: context.dynamicWidth(0.28),
        child: Card(
          elevation: 3.0,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    FancyShimmerImage(
                      imageUrl: "${widget.productModel.productImage![0]}",
                      boxFit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          widget.onDelete();
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 14.0,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.close, color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1,
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(color: blueColor),
                          child: Center(
                            child: Text(
                              "Kargo bedava",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${widget.productModel.productDescription}",
                    maxLines: 1, // Kaç satır görüneceğini buradan ayarlayabilirsiniz
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: _starList,
                    ),
                    Text("(1723)")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "\$${widget.productModel.productOriginalPrice.toString().replaceAll(".", ",")}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "${widget.productModel.discount}",
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(""),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(195, 40),
                  primary: blueColor
                ),
                child: Text("Add To Cart"),
                onPressed: () async{
                  final QuerySnapshot querySnapshot = await FirebaseFirestore
                      .instance
                      .collection('Carts')
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .collection("YourCarts")
                      .where('productId',
                      isEqualTo: widget.productModel.productId)
                      .get();
                  if (querySnapshot.docs.isEmpty) {
                    setState(() {
                      _isLoading = true;
                    });

                    Future.delayed(Duration(seconds: 3), () async {
                      cartProd.addCartData(
                          productId: widget.productModel.productId,
                          productImage: widget.productModel.productImage,
                          productDescription:
                          widget.productModel.productDescription,
                          productOriginalPrice:
                          widget.productModel.productOriginalPrice,
                          isChecked: true,
                          orderQte: widget.productModel.orderQuantity,
                          totalUnit: widget.productModel.totalUnit,
                          selectedSize: ''
                      );
                      _isLoading = false;
                    }).then((value) async => await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartPage(
                                isVisible: widget.productModel.isChecked))));
                  } else {
                    Fluttertoast.showToast(
                      msg: "this product already exist",
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewSeasonDetails(
                      productModel: widget.productModel,
                    )));
      },
    );
  }
}

//for double rating=3.5=>5
class _Clipper extends CustomClipper<Rect> {
  final int part;
  _Clipper({required this.part});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
        (size.width / 10) * part, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}