import 'package:abashop/Aba-Shop/constants/colors.dart';
import 'package:abashop/Aba-Shop/screens/oder-page/single-order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:provider/provider.dart';

import '../../providers/cart-provider.dart';
import '../../providers/order-provider.dart';
import '../../widgets/bottom-app-bar/bottom-nav-bar.dart';
import '../../widgets/navbar/navbar.dart';
import '../../widgets/text/text-widget.dart';

class OrderPage extends StatelessWidget {
  OrderProvider? orderProvider;

  @override
  Widget build(BuildContext context) {
    orderProvider = Provider.of<OrderProvider>(context);
    orderProvider?.getOrderData();
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        elevation: 0.0,
        title: TextWidget(
          text: "Abashop",
          color: Colors.white,
          textSize: 24,
          isTile: true,
        ),
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
                          BottomNavBar(selectedIndex: 3)));;
            },
          ),
        ],
      ),
      drawer: NavberWidget(),
      body: orderProvider!.getOrderDataList.isEmpty
          ? Center(
              child: Text("NO DATA"),
            )
          : ListView(
              children: [
                Row(
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
                          child: TextWidget(
                            text: "Order Details",
                            color: Colors.black,
                            textSize: 20,
                            isTile: true,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "/home");
                        },
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: orderProvider!.getOrderDataList.length,
                  itemBuilder: (context, index) {
                    return SingleOrder(
                      productModel: orderProvider!.getOrderDataList[index],
                    );
                  },
                ),
              ],
            ),
    );
  }
}
