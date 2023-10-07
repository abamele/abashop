import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../providers/cart-provider.dart';
import '../../widgets/bottom-app-bar/bottom-nav-bar.dart';
import '../../widgets/navbar/navbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    cartProvider.getCartData();

    return Scaffold(
      drawer: NavberWidget(),
      body: NestedScrollView(
        headerSliverBuilder: (context, scroll) {
          return [
            SliverAppBar(
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
            )
          ];
        },
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 70,
                  color: blueColor,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [
                    SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Men",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                ),
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Women",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                ),
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Shoes & Bags",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                ),
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Kids",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          /*Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18.0, left: 18.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      "assets/woman tshirt.png"),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text("Buy"),
                              )
                            ],
                          ),*/
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18.0, left: 18.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      "assets/woman tshirt.png"),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text("Clothers"),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18.0, left: 18.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      "assets/woman tshirt.png"),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text("T-Shirt"),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18.0, left: 18.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      "assets/woman tshirt.png"),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text("Shoes"),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18.0, left: 18.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      "assets/woman tshirt.png"),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text("Sweatshirt"),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18.0, left: 18.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      "assets/woman tshirt.png"),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text("Pant"),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 18.0, left: 18.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      "assets/woman tshirt.png"),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text("Bag"),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: InkWell(
                        child: Container(
                            width: double.infinity,
                            child: Container(
                                margin: EdgeInsets.only(left: 15, right: 10),
                                width: 150,
                                child: ClipRRect(
                                  child: Image.asset(
                                    width: double.infinity,
                                    "assets/new_season_dash1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ))),
                        onTap: () {
                          Navigator.pushNamed(context, "/new-seasons");
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: InkWell(
                        child: Container(
                            width: double.infinity,
                            child: Container(
                                margin: EdgeInsets.only(left: 15, right: 10),
                                width: 150,
                                child: ClipRRect(
                                  child: Image.asset(
                                    width: double.infinity,
                                    "assets/autum_dash1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ))),
                        onTap: () {
                          Navigator.pushNamed(context, "/autumn");
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: InkWell(
                        child: Container(
                            width: double.infinity,
                            child: Container(
                                margin: EdgeInsets.only(left: 15, right: 10),
                                width: 150,
                                child: ClipRRect(
                                  child: Image.asset(
                                    width: double.infinity,
                                    "assets/all_prod_dash1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ))),
                        onTap: () {
                          Navigator.pushNamed(context, "/all-product");
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: InkWell(
                        child: Container(
                            width: double.infinity,
                            child: Container(
                                margin: EdgeInsets.only(left: 15, right: 10),
                                width: 150,
                                child: ClipRRect(
                                  child: Image.asset(
                                    width: double.infinity,
                                    "assets/new_collection_dash1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ))),
                        onTap: () {
                          Navigator.pushNamed(context, "/new-collection");
                        },
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
