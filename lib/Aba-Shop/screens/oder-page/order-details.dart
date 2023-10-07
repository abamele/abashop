import 'package:abashop/Aba-Shop/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/product-model.dart';
import '../../providers/cart-provider.dart';
import '../../widgets/bottom-app-bar/bottom-nav-bar.dart';
import '../../widgets/navbar/navbar.dart';
import '../../widgets/text/text-widget.dart';


class OrderDetails extends StatelessWidget {
  ProductModel productModel;
  OrderDetails({Key? key, required this.productModel}) : super(key: key);
  DateTime currentDate = DateTime.now();
  DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context, listen: false);
    cartProvider.getCartData();

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: blueColor,
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
                        builder: (context) =>
                            BottomNavBar(selectedIndex: 3)));;
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
                        builder: (context) =>
                            BottomNavBar(selectedIndex: 1)));;
              },
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 8.0),
                child: Center(
                  child: FlutterBadge(
                    itemCount: cartProvider.cartCounter,
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
                        builder: (context) =>
                            BottomNavBar(selectedIndex: 2)));;
              },
            ),
          ],
        ),
        drawer: NavberWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.chevron_back,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: ListTile(
                      title: Center(
                        child: TextWidget(
                          text: "Order Details",
                          color: Colors.black,
                          textSize: 20,
                          isTile: true,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Order Date: ",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        TextWidget(
                          text: "${productModel.dateAdded}",
                          color: Colors.black,
                          textSize: 16,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Order Details: ",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Expanded(
                            child: TextWidget(
                              text:
                              "${productModel.orderQuantity} items have been ordered",
                              color: Colors.black,
                              textSize: 16,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Total: ",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        TextWidget(
                          text: "\$${productModel.totalPrice.toStringAsFixed(2)}",
                          color: Colors.black,
                          textSize: 16,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "Estimated Delivery: ",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              TextWidget(
                                text: "${formatter.format(currentDate.add(Duration(days: 7)))}",
                                color: Colors.black,
                                textSize: 16,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "Seller Name: ",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              TextWidget(
                                  text: "${productModel.sellerName}",
                                  color: Colors.black,
                                  textSize: 16),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
