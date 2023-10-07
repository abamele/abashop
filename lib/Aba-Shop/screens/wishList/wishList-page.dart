import 'package:abashop/Aba-Shop/providers/cart-provider.dart';
import 'package:abashop/Aba-Shop/screens/wishList/single-wishList-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../providers/wishList-provider.dart';
import '../../widgets/bottom-app-bar/bottom-nav-bar.dart';
import '../../widgets/navbar/navbar.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key, required bool isVisible});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();
    CartProvider cartProvider = Provider.of(context);

    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth > 600
        ? 2
        : 2; // Tablet için 3 sütun, diğerleri için 2 sütun
    double aspectRatio = screenWidth > 600
        ? 1.5
        : 0.396; // Tablet için daha geniş, diğerleri için dengeli boyut oranı

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
      body: wishListProvider.getWishListDataList.isEmpty
          ? Center(
              child: Text("No Data"),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: aspectRatio,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemCount: wishListProvider.getWishListDataList.length,
              itemBuilder: (context, index) {
                final data = wishListProvider.getWishListDataList[index];
                return SingleWishList(
                  productModel: data,
                  onDelete: () {
                    print(wishListProvider.getWishListDataList[index].productId);
                    wishListProvider.wishDataDelete(
                        wishListProvider.getWishListDataList[index].productId, context);
                  },
                );
              }),
    );
  }
}
