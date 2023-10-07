import 'package:abashop/Aba-Shop/screens/carts/cart-page.dart';
import 'package:abashop/Aba-Shop/screens/profile/profile-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../screens/home/home-page.dart';

class BottomAppBarStraightWidget extends StatelessWidget {
  BottomAppBarStraightWidget({Key? key}) : super(key: key);

  final ValueNotifier<int> selectButton = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          selectItemWidget(1, Icons.home_outlined, "Anasayfa"),
          selectItemWidget(2, CupertinoIcons.heart, "Favorilerim"),
          selectItemWidget(3, Icons.shopping_cart_outlined, "Sepetim"),
          selectItemWidget(4, CupertinoIcons.person, "Profil")
        ],
      ),
    );
  }

  Widget selectItemWidget(
    int index,
    IconData icon,
    String txt,
  ) {
    return ValueListenableBuilder(
      valueListenable: selectButton,
      builder: (BuildContext context, int value, Widget? child) {
        return Container(
          child: Row(
            children: [
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icon,
                        color: value == index ? blueColor : Colors.grey,
                        size: 25,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        txt,
                        style: TextStyle(
                            color: value == index ? blueColor : Colors.grey,
                            fontSize: 17),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  if (index == 1) {
                    selectButton.value = index;
                    Navigator.pushNamed(context, "/home");
                  } else if (index == 2) {
                    selectButton.value = index;
                    Navigator.pushNamed(context, "/wishlist");
                  } else if (index == 3) {
                    selectButton.value = index;
                    Navigator.pushNamed(context, "/cart");
                  } else if (index == 4) {
                    selectButton.value = index;
                    Navigator.pushNamed(context, "/signin");
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
