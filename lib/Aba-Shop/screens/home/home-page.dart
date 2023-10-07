import 'package:abashop/Aba-Shop/constants/context-extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../providers/cart-provider.dart';
import '../carts/cart-page.dart';
import '../profile/profile-page.dart';
import '../wishList/wishList-page.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> selectButton = ValueNotifier<int>(0);
  TextEditingController customeName = TextEditingController();
  TextEditingController contacts = TextEditingController();
  TextEditingController validityDate = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController comment = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List txtList = ["Teklif Bilgiler", "Ürün Bilgileri"];
  List txtState = ["Devam Ediyor", "Onaylandı", "Reddedildi", "İptal"];
  ValueNotifier<int?> _value1 = ValueNotifier<int?>(null);

  int? _value2 = 0;
  int? value3 = 0;
  int? value4 = 0;
  DateTime selectedDate = DateTime.now();
  DateTime? dateTime1;
  DateTime? dateTime2;
  String? strDate;

  int _currentIndex = 0;
  final List<Widget> _pages = [
    Home(), // İlk sayfa
    WishListPage(isVisible: false,), // İkinci sayfa
    CartPage(isVisible: false), // Üçüncü sayfa
    ProfilePage(), // Üçüncü sayfa
  ];

  @override
  void initState() {
    CartProvider cartProvider = Provider.of(context, listen: false);
    cartProvider.getCartData();
    cartProvider.cartCounter;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    cartProvider.getCartData();
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: _pages[_currentIndex],
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                    color: 0 == _currentIndex ? blueColor : Colors.grey,
                  ),
                  onPressed: () {
                    _changePage(0);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Home",
                      style: TextStyle(
                          color: 0 == _currentIndex ? blueColor : Colors.grey,
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
                    color: 1 == _currentIndex ? blueColor : Colors.grey,
                  ),
                  onPressed: () {
                    _changePage(1);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Favourite",
                      style: TextStyle(
                          color: 1 == _currentIndex ? blueColor : Colors.grey,
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
                    color: 2 == _currentIndex ? blueColor : Colors.grey,
                  ),
                  onPressed: () {
                    _changePage(2);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Cart",
                      style: TextStyle(
                          color: 2 == _currentIndex ? blueColor : Colors.grey,
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
                    color: 3 == _currentIndex ? blueColor : Colors.grey,
                  ),
                  onPressed: () {
                    _changePage(3);
                    // İstediğiniz sayfayı açabilirsiniz
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Profile",
                      style: TextStyle(
                          color: 3 == _currentIndex ? blueColor : Colors.grey,
                          fontSize: 17)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _reload(var value) async {
    setState(() {});
  }

  Widget selectMenuWidget(int index, IconData icon, String text) {
    return ValueListenableBuilder(
      valueListenable: selectButton,
      builder: (BuildContext context, int value, Widget? child) {
        return MaterialButton(
            child: Card(
              elevation: 5.0,
              color: value == index ? blueColor : Colors.white,
              margin: EdgeInsets.only(top: 30),
              child: Container(
                width: context.dynamicWidth(0.40),
                height: context.dynamicHeight(0.15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        size: 25,
                        color: value == index ? Colors.white : blueColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: value == index
                                  ? Colors.white
                                  : Color(0xff4F4F4F))),
                    ),
                  ],
                ),
              ),
            ),
            onPressed: () {
              if (index == 1) {
                selectButton.value = index;
              } else if (index == 2) {
                selectButton.value = index;
              } else if (index == 3) {
                selectButton.value = index;
              } else if (index == 4) {
                selectButton.value = index;
              }
              ;
            });
      },
    );
  }
}
