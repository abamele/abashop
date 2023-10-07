import 'package:abashop/Aba-Shop/constants/context-extension.dart';
import 'package:abashop/Aba-Shop/models/product-model.dart';
import 'package:abashop/Aba-Shop/providers/wishList-provider.dart';
import 'package:abashop/Aba-Shop/screens/kids/baby-clothes/baby-clothes-details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';


class SingleBabyClothes extends StatefulWidget {
  SingleBabyClothes({super.key, required this.productModel});
  ProductModel productModel;
  @override
  State<SingleBabyClothes> createState() => _SingleBabyClothesState();
}

class _SingleBabyClothesState extends State<SingleBabyClothes> {
  User? user = FirebaseAuth.instance.currentUser;
  List fav = [];

  double rating=3.5;
  int? ratingCount=12;


  getWishList() {
    FirebaseFirestore.instance
        .collection("newSeason")
        .doc(widget.productModel.productId)
        .get()
        .then((value) {
      if (mounted)
        setState(() {
          fav = value["WishList"];
        });
      if (fav.contains(user?.uid)) {
        if (mounted)
          setState(() {
            wishListBool = true;
          });
      } else {
        if (mounted)
          setState(() {
            wishListBool = false;
          });
      }
    });
  }

  bool wishListBool = false;

  @override
  void initState() {
    getWishList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();

    List<Widget> _starList=[];
    int realNumber=rating.floor();
    int partNumber=((rating-realNumber)*10).ceil();

    for(int i=0; i<5; i++){
      if(i<realNumber){
        _starList.add(Icon(Icons.star, color: Colors.amber, size: 18,));
      }else if(i==realNumber){
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
      }else{
        _starList.add(Icon(Icons.star, color: Colors.grey, size: 18,));
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
              Expanded(
                child: Container(
                  child: Stack(
                    children: [
                      FancyShimmerImage(
                        imageUrl: "${widget.productModel.productImage![0]}",
                        boxFit: BoxFit.fill,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(
                              wishListBool == false
                                  ? Icons.favorite_outline
                                  : Icons.favorite,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(() {
                                wishListBool = !wishListBool;
                                wishListProvider.updateWishList(wishListBool, widget.productModel.productId, context);
                              });
                            },
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 15),
                child: Text(
                  "${widget.productModel.productDescription}",
                  maxLines: 1, // Kaç satır görüneceğini buradan ayarlayabilirsiniz
                  overflow: TextOverflow.ellipsis,
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
                child: Text(
                  "\$${widget.productModel.productOriginalPrice.toString().replaceAll(".", ",")}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(""),
              ),

            ],
          ),
        ),
      ),
      onTap: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BabyClothesDetails(
                  productModel: widget.productModel,
                )));
      },
    );
  }
}

//for double rating=3.5=>5
class _Clipper extends CustomClipper<Rect>{
  final int part;
  _Clipper({required this.part});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB((size.width/10)*part, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
