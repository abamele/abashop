import 'package:abashop/Aba-Shop/providers/cart-provider.dart';
import 'package:abashop/Aba-Shop/screens/carts/single-cart.dart';
import 'package:abashop/Aba-Shop/screens/submit/submit-cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../widgets/bottom-app-bar/bottom-nav-bar.dart';
import '../../widgets/navbar/navbar.dart';
import '../../widgets/text/text-widget.dart';

class CartPage extends StatefulWidget {
  bool isVisible;
  CartPage({super.key, required this.isVisible});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartProvider? cartProvider;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    cartProvider.getCartData();
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth > 600
        ? 2
        : 2; // Tablet için 3 sütun, diğerleri için 2 sütun
    double aspectRatio = screenWidth > 600
        ? 1.5
        : 0.43; // Tablet için daha geniş, diğerleri için dengeli boyut oranı

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
      body: cartProvider.cartItems.isEmpty
          ? Center(
              child: Text("No Data"),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            CupertinoIcons.chevron_back,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/home");
                          },
                        ),
                        Expanded(
                          child: ListTile(
                            title: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    text: "Cart",
                                    color: Colors.black,
                                    textSize: 18,
                                    isTile: true,
                                  ),
                                  TextWidget(
                                    text: "(${cartProvider.cartCounter})",
                                    color: Colors.black,
                                    textSize: 18,
                                    isTile: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartProvider.cartItems.length,
                      itemBuilder: (context, index) {
                        final data = cartProvider.cartItems[index];

                        return SingleCart(
                          productModel: data,
                          onDelete: () {
                            cartProvider.cartDataDelete(
                                cartProvider.cartItems[index].productId);
                          },
                          isBool: false,
                          wishList: false,
                        );
                      }),
                ],
              ),
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
            text:
                "\$${cartProvider.totalPrice.toStringAsFixed(2).replaceAll(".", ",")}",
            color: Colors.black,
            textSize: 24,
            isTile: true,
          ),
          trailing: cartProvider.cartItems.isEmpty
              ? null
              : Visibility(
                  visible: widget.isVisible = true,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: MaterialButton(
                      height: 55,
                      child: TextWidget(
                        text: "Buy Now",
                        color: Colors.white,
                        textSize: 17,
                        isTile: true,
                      ),
                      color: blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                      ),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubmitCart()));
                      },
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
