import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../screens/carts/cart-page.dart';
import '../../screens/home/home.dart';
import '../../screens/profile/profile-page.dart';
import '../../screens/wishList/wishList-page.dart';

class BottomNavBar extends StatefulWidget {
  int selectedIndex = 0;
  BottomNavBar({super.key, required this.selectedIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  void onItemTapped(int index){
    widget.selectedIndex=index;
    _currentIndex=widget.selectedIndex;
  }

  final List<Widget> _pages = [
    Home(), // İlk sayfa
    WishListPage(
      isVisible: false,
    ), // İkinci sayfa
    CartPage(isVisible: false), // Üçüncü sayfa
    ProfilePage(), // Üçüncü sayfa
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    onItemTapped(widget.selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = _currentIndex == 0
        ? Home()
        : _currentIndex == 1
            ? WishListPage(isVisible: false)
            : _currentIndex == 2
                ? CartPage(isVisible: false)
                : ProfilePage();
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        elevation: 20.0,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 25,
                    color: _currentIndex==0 ? blueColor : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = Home();
                      _currentIndex = 0;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Home",
                      style: TextStyle(
                          color: _currentIndex==0 ? blueColor : Colors.grey,
                          fontSize: 17)),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.heart,
                    size: 25,
                    color: _currentIndex==1 ? blueColor : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = WishListPage(isVisible: false);
                      _currentIndex = 1;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Favourite",
                      style: TextStyle(
                          color: _currentIndex==1 ? blueColor : Colors.grey,
                          fontSize: 17)),
                )
              ],
            ),
            SizedBox(), // Orta bölgeyi boş bırakmak için SizedBox ekleyin
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 25,
                    color: _currentIndex==2 ? blueColor : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = CartPage(isVisible: false);
                      _currentIndex = 2;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Cart",
                      style: TextStyle(
                          color: _currentIndex==2 ? blueColor : Colors.grey,
                          fontSize: 17)),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.person,
                    size: 25,
                    color: _currentIndex==3 ? blueColor : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = ProfilePage();
                      _currentIndex = 3;
                    });
                    // İstediğiniz sayfayı açabilirsiniz
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Profile",
                      style: TextStyle(
                          color: _currentIndex==3 ? blueColor : Colors.grey,
                          fontSize: 17)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
