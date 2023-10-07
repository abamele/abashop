import 'package:abashop/Aba-Shop/screens/autumn/single-autumn.dart';
import 'package:abashop/Aba-Shop/screens/new-seasons/single-new-season.dart';
import 'package:abashop/Aba-Shop/widgets/navbar/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../providers/autumn-provider.dart';
import '../../providers/cart-provider.dart';
import '../../widgets/bottom-app-bar/bottom-appbar-widget.dart';
import '../../widgets/bottom-app-bar/bottom-nav-bar.dart';

class AutumnPage extends StatefulWidget {
  const AutumnPage({super.key});

  @override
  State<AutumnPage> createState() => _AutumnPageState();
}

class _AutumnPageState extends State<AutumnPage> {
  @override
  Widget build(BuildContext context) {
    AutumnProvider autumnProvider = Provider.of(context);
    autumnProvider.getAutumnData();
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
      body: autumnProvider.autumnDataList.isEmpty
          ? Center(
        child: Text("No Data"),
      )
          : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: aspectRatio,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: autumnProvider.getAutumnDataList.length,
          itemBuilder: (context, index) {
            final data = autumnProvider.getAutumnDataList[index];
            return SingleAutumn(productModel: data);
          }),
    );
  }
}
