import 'package:abashop/Aba-Shop/screens/women/hijab/tshirt/single-tshirt.dart';
import 'package:abashop/Aba-Shop/widgets/navbar/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../../../providers/cart-provider.dart';
import '../../../../providers/women-provider/hijab-provider/tshirt-provider.dart';
import '../../../../widgets/bottom-app-bar/bottom-nav-bar.dart';

class WomenTShirtPage extends StatefulWidget {
  const WomenTShirtPage({super.key});

  @override
  State<WomenTShirtPage> createState() => _WomenTShirtPageState();
}

class _WomenTShirtPageState extends State<WomenTShirtPage> {
  @override
  Widget build(BuildContext context) {
    TshirtProvider tshirtProvider = Provider.of(context);
    tshirtProvider.getTshirtData();
    CartProvider cartProvider = Provider.of(context);
    cartProvider.getCartData();

    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth > 600
        ? 2
        : 2; // Tablet için 3 sütun, diğerleri için 2 sütun
    // Tablet için daha geniş, diğerleri için dengeli boyut oranı
    double aspectRatio = screenWidth > 600 ? 1.5 : 0.43;
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
      body: tshirtProvider.tshirtDataList.isEmpty
          ? Center(
        child: Text("No Data"),
      )
          : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: aspectRatio,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: tshirtProvider.getTshirtDataList.length,
          itemBuilder: (context, index) {
            final data = tshirtProvider.getTshirtDataList[index];
            return SingleWomenTShirt(productModel: data);
          }),
    );
  }
}
