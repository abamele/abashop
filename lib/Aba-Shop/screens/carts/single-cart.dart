import 'package:abashop/Aba-Shop/constants/colors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../components/utils.dart';
import '../../models/product-model.dart';
import '../../providers/cart-provider.dart';
import '../../widgets/text/text-widget.dart';

class SingleCart extends StatefulWidget {
  ProductModel productModel;
  Function onDelete;
  bool isBool = false;
  var productUnit;
  bool wishList = false;

  SingleCart(
      {required this.productModel,
      required this.onDelete,
      required this.isBool,
      required this.wishList});

  @override
  _SingleCartState createState() => _SingleCartState();
}

class _SingleCartState extends State<SingleCart> {
  CartProvider? cartProvider;
  num total = 0.0;
  int count = 1;
  num totalUnit = 1;
  bool isMax = true;

  getCount() {
    setState(() {
      count = widget.productModel.orderQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    cartProvider = Provider.of<CartProvider>(context);
    cartProvider = Provider.of<CartProvider>(context);
    cartProvider!.getCartData();

    Size size = Utils(context).screensSize;
    Color color = Utils(context).color;
    return Card(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FancyShimmerImage(
                  alignment: Alignment.bottomCenter,
                  imageUrl: "${widget.productModel.productImage![0]}",
                  width: size.width * 0.3,
                  height: size.height * 0.2,
                  boxFit: BoxFit.fill,
                  boxDecoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "ABASHOP",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            widget.onDelete();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              CupertinoIcons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget(
                        text: "${widget.productModel.productDescription}",
                        color: color,
                        textSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 5),
                          child: TextWidget(
                            text: "Size:",
                            color: color,
                            textSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: TextWidget(
                            text: "${widget.productModel.selectedSize}",
                            color: color,
                            textSize: 14,
                            isTile: true,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 5),
                            child: Text(
                              "Estimate Delivering To Cargo:",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ),
                        ),
                        TextWidget(
                          text: "2 Days",
                          color: color,
                          textSize: 14,
                        )
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "\$${widget.productModel.productOriginalPrice.toStringAsFixed(2).replaceAll(".", ",")}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        )),
                    widget.wishList == false
                        ? Container(
                            margin: EdgeInsets.all(8.0),
                            width: 120,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (count == 1) {
                                      Fluttertoast.showToast(
                                        msg: "your Reach Minimum Limit",
                                      );
                                    } else {
                                      setState(() {
                                        count--;
                                      });
                                      cartProvider?.updateCartData(
                                        productImage:
                                            widget.productModel.productImage,
                                        productId:
                                            widget.productModel.productId,
                                        productDescription: widget
                                            .productModel.productDescription,
                                        productOriginalPrice: widget
                                            .productModel.productOriginalPrice,
                                        productMinOrder: count,
                                        totalUnit: total +
                                            widget.productModel
                                                    .productOriginalPrice *
                                                widget
                                                    .productModel.orderQuantity,
                                      );
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3.0, left: 4),
                                    child: InkWell(
                                      child: Container(
                                        //height: 30,
                                        //width: 30,
                                        /*decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                        BorderRadius.circular(10)),*/
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                      ),
                                      onTap: () {
                                        if (count == 1) {
                                          return;
                                        } else {
                                          setState(() {
                                            count--;
                                          });
                                          cartProvider?.updateCartData(
                                            productImage: widget
                                                .productModel.productImage,
                                            productId:
                                                widget.productModel.productId,
                                            productDescription: widget
                                                .productModel
                                                .productDescription,
                                            productOriginalPrice: widget
                                                .productModel
                                                .productOriginalPrice,
                                            productMinOrder: count,
                                            totalUnit: total +
                                                widget.productModel
                                                        .productOriginalPrice *
                                                    widget.productModel
                                                        .orderQuantity,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    "${count}",
                                    style: TextStyle(
                                        color: blueColor, fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: InkWell(
                                    child: Container(
                                      //height: 30,
                                      //width: 30,
                                      /*decoration: BoxDecoration(
                                      color: blueColor,
                                      borderRadius:
                                      BorderRadius.circular(10)),*/
                                      child: Icon(
                                        Icons.add,
                                        color: blueColor,
                                        size: 30,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        count++;
                                      });
                                      cartProvider?.updateCartData(
                                        productImage:
                                            widget.productModel.productImage,
                                        productId:
                                            widget.productModel.productId,
                                        productDescription: widget
                                            .productModel.productDescription,
                                        productOriginalPrice: widget
                                            .productModel.productOriginalPrice,
                                        productMinOrder: count,
                                        totalUnit: total +
                                            widget.productModel
                                                    .productOriginalPrice *
                                                widget
                                                    .productModel.orderQuantity,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ],
          ),
          widget.isBool == false
              ? Container()
              : Divider(
                  height: 1,
                  color: Colors.black45,
                )
        ],
      ),
    );
  }
}
