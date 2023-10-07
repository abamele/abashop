import 'package:abashop/Aba-Shop/constants/context-extension.dart';
import 'package:abashop/Aba-Shop/models/product-model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../new-seasons/new-season-details.dart';

class CartSingleProduct extends StatefulWidget {
  CartSingleProduct({super.key, required this.productModel});
  ProductModel productModel;
  @override
  State<CartSingleProduct> createState() => _CartSingleProductState();
}

class _CartSingleProductState extends State<CartSingleProduct> {

  @override
  Widget build(BuildContext context) {

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
                        imageUrl: "${widget.productModel.productImage}",
                        boxFit: BoxFit.fill,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(
                               Icons.clear,
                              size: 30,
                            ),
                            onPressed: () {

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
                            decoration: BoxDecoration(color: Colors.deepOrangeAccent),
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
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Etoileeeeeeee",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "\$${widget.productModel.productOriginalPrice.toString().replaceAll(".", ",")}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
              Text("")
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
