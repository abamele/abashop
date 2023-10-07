import 'package:abashop/Aba-Shop/providers/profile-provider.dart';
import 'package:abashop/Aba-Shop/screens/profile/profile-edit.dart';
import 'package:abashop/Aba-Shop/widgets/bottom-app-bar/bottom-nav-bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../providers/cart-provider.dart';
import '../../widgets/navbar/navbar.dart';
import '../../widgets/text/text-widget.dart';
import '../carts/cart-page.dart';
import '../home/home.dart';
import '../wishList/wishList-page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Home(), // İlk sayfa
    WishListPage(
      isVisible: false,
    ), // İkinci sayfa
    CartPage(isVisible: false), // Üçüncü sayfa
    ProfilePage(), // Üçüncü sayfa
  ];

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    ProfileDataProvider profileDataProvider = Provider.of(context);
    profileDataProvider.getUserData();
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
                            BottomNavBar(selectedIndex: 2)));;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /*Container(
                          padding: EdgeInsets.all(10),
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/profile-image.jpg"),
                            radius: 40,
                          ),
                        ),*/
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
                            text:
                                "${profileDataProvider.currentData?.fullName}",
                            color: Colors.black,
                            textSize: 18,
                            isTile: true,
                          ),
                        ),
                        subtitle: Center(
                          child: Text(
                            "${profileDataProvider.currentData?.email}",
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8.0),
                child: ListTile(
                  leading: Icon(
                    IconlyLight.location,
                    size: 30,
                  ),
                  title: Text("${profileDataProvider.currentData?.address}"),
                  onTap: () {},
                ),
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ListTile(
                  title: TextWidget(
                    text: "account information",
                    color: Colors.black,
                    textSize: 22,
                  ),
                  leading: Icon(IconlyLight.profile),
                  trailing: Icon(IconlyLight.arrowRight2),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfile(
                                  profileDataProvider: profileDataProvider,
                                )));
                  },
                ),
              ),
              ListTile(
                title: TextWidget(
                  text: "order",
                  color: Colors.black,
                  textSize: 22,
                ),
                leading: Icon(IconlyLight.buy),
                trailing: Icon(IconlyLight.arrowRight2),
                onTap: () {
                  Navigator.pushNamed(context, "/my-order");
                },
              ),
              ListTile(
                title: TextWidget(
                  text: "Wishlist",
                  color: Colors.black,
                  textSize: 22,
                ),
                leading: Icon(CupertinoIcons.heart),
                trailing: Icon(IconlyLight.arrowRight2),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BottomNavBar(selectedIndex: 1)));
                },
              ),
              ListTile(
                title: TextWidget(
                  text: "my cart",
                  color: Colors.black,
                  textSize: 22,
                ),
                leading: Icon(IconlyLight.buy),
                trailing: Icon(IconlyLight.arrowRight2),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BottomNavBar(selectedIndex: 2)));
                },
              ),
              ListTile(
                title: TextWidget(
                  text: "logout",
                  color: Colors.black,
                  textSize: 22,
                ),
                leading: Icon(IconlyLight.logout),
                trailing: Icon(IconlyLight.arrowRight2),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/signin", (route) => false);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(""),
              )
            ],
          ),
        ));
  }
}
