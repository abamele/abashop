import 'package:abashop/Aba-Shop/constants/colors.dart';
import 'package:abashop/Aba-Shop/screens/kids/baby-clothes/baby-clothes-page.dart';
import 'package:abashop/Aba-Shop/screens/kids/children-clothes/children-clothes-page.dart';
import 'package:abashop/Aba-Shop/screens/kids/children-shoes/children-shoes-page.dart';
import 'package:abashop/Aba-Shop/screens/men/men-bag/men-bag-page.dart';
import 'package:abashop/Aba-Shop/screens/men/men-pant/pant-page.dart';
import 'package:abashop/Aba-Shop/screens/men/men-shoes/shoes-page.dart';
import 'package:abashop/Aba-Shop/screens/men/men-sweatshirt/sweatshirt-page.dart';
import 'package:abashop/Aba-Shop/screens/men/men-t-shirt/tshirt-page.dart';
import 'package:abashop/Aba-Shop/screens/oder-page/order-page.dart';
import 'package:abashop/Aba-Shop/screens/women/bags/backpack/backpack-page.dart';
import 'package:abashop/Aba-Shop/screens/women/bags/hand-bag/hand-bag-page.dart';
import 'package:abashop/Aba-Shop/screens/women/bags/shoulder-bag/shoulder-bag-page.dart';
import 'package:abashop/Aba-Shop/screens/women/headscarf/bonnet/bonnet-page.dart';
import 'package:abashop/Aba-Shop/screens/women/headscarf/combed-cotton-shawl/combed-cotton-shawl-page.dart';
import 'package:abashop/Aba-Shop/screens/women/headscarf/cotton-shawl/cotton-shawl-page.dart';
import 'package:abashop/Aba-Shop/screens/women/headscarf/medine-silk-shawl/medine-silk-shawl-page.dart';
import 'package:abashop/Aba-Shop/screens/women/headscarf/scarf/scarf-page.dart';
import 'package:abashop/Aba-Shop/screens/women/headscarf/turban/turban-page.dart';
import 'package:abashop/Aba-Shop/screens/women/hijab/dress/dress-page.dart';
import 'package:abashop/Aba-Shop/screens/women/hijab/hijab/hijab-page.dart';
import 'package:abashop/Aba-Shop/screens/women/hijab/pant/pant-page.dart';
import 'package:abashop/Aba-Shop/screens/women/hijab/skirt/skirt-page.dart';
import 'package:abashop/Aba-Shop/screens/women/hijab/suit/suit-page.dart';
import 'package:abashop/Aba-Shop/screens/women/hijab/tshirt/tshirt-page.dart';
import 'package:abashop/Aba-Shop/screens/women/hijab/tunic/tunic-page.dart';
import 'package:abashop/Aba-Shop/screens/women/hijab/waistcoat/waistcoat-page.dart';
import 'package:abashop/Aba-Shop/screens/women/outer-clothing/abaya/abaya-page.dart';
import 'package:abashop/Aba-Shop/screens/women/outer-clothing/coat/coat-page.dart';
import 'package:abashop/Aba-Shop/screens/women/outer-clothing/jacket/jacket-page.dart';
import 'package:abashop/Aba-Shop/screens/women/outer-clothing/kimono/kimono-page.dart';
import 'package:abashop/Aba-Shop/screens/women/outer-clothing/poncho/poncho-page.dart';
import 'package:abashop/Aba-Shop/screens/women/outer-clothing/raincoat/raincoat-page.dart';
import 'package:abashop/Aba-Shop/screens/women/shoes/flat/flat-page.dart';
import 'package:abashop/Aba-Shop/screens/women/shoes/sneakers/sneakers-page.dart';
import 'package:abashop/Aba-Shop/widgets/bottom-app-bar/bottom-nav-bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../screens/women/headscarf/shawl/shawl-page.dart';
import '../../screens/women/hijab/knitwear/knitwear-page.dart';


class NavberWidget extends StatelessWidget {
  NavberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: blueColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: blueColor,
            ),
            accountName: Center(
              child: Text(
                "ABASHOP",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            accountEmail: Text(""),
            /*currentAccountPicture: Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/profile-image.jpg"),
                radius: 40,
              ),
            ),*/
            /*decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/logo.jpg"), fit: BoxFit.cover)),*/
          ),
          ExpansionTile(
            expandedAlignment: Alignment.topLeft,
            title: Text(
              "MEN",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            children: [
              /*Divider(
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      child: Text("Clothes",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      onPressed: () {},
                    )),
              ),*/
              Divider(
                thickness: 3,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        child: Text("T-shirt",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenTShirtPage()));
                        },
                      )),
                ),
                onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenTShirtPage()));
                }
              ),
              Divider(
                thickness: 3,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        child: Text("Shoes",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenShoesPage()));
                        },
                      )),
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenShoesPage()));
                },
              ),
              Divider(
                thickness: 3,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        child: Text("Sweatshirt",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenSweatshirtPage()));
                        },
                      )),
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenSweatshirtPage()));
                },
              ),
              Divider(
                thickness: 3,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        child: Text("Pant",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenPantPage()));
                        },
                      )),
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenPantPage()));
                },
              ),
              Divider(
                thickness: 3,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        child: Text("Bag",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenBagPage()));
                        },
                      )),
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenBagPage()));
                },
              ),

            ],
          ),
          Divider(
            thickness: 3,
          ),
          ExpansionTile(
            expandedAlignment: Alignment.topLeft,
            title: Text(
              "WOMEN",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            children: [
              ExpansionTile(
                  title: Text("HIJAB CLOTHING", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),),
              children: [
                Divider(
                  thickness: 3,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text("Tunic",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TunicPage()));
                          },
                        )),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TunicPage()));
                  },
                ),
                Divider(
                  thickness: 3,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text("Suit",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuitPage()));
                          },
                        )),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuitPage()));
                  },
                ),
                Divider(
                  thickness: 3,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text("Dress",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DressPage()));
                          },
                        )),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DressPage()));
                  },
                ),
                Divider(
                  thickness: 3,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text("Pant",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PantPage()));
                          },
                        )),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PantPage()));
                  },
                ),
                Divider(
                  thickness: 3,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text("Skirt",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SkirtPage()));
                          },
                        )),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SkirtPage()));
                  },
                ),
                /*Divider(
                  thickness: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        child: Text("Shirt&Blouse",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onPressed: () {

                        },
                      )),
                ),*/
                Divider(
                  thickness: 3,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text("Hijab",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HijabPage()));
                          },
                        )),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HijabPage()));
                  },
                ),
                Divider(
                  thickness: 3,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text("Waistcoat",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WaistcoatPage()));
                          },
                        )),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WaistcoatPage()));
                  },
                ),
                Divider(
                  thickness: 3,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text("Knitwear",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => KnitwearPage()));
                          },
                        )),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KnitwearPage()));
                  },
                ),
                Divider(
                  thickness: 3,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text("Hijab Tracksuit",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HijabPage()));
                          },
                        )),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HijabPage()));
                  },
                ),
                Divider(
                  thickness: 3,
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text("T-shirt",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WomenTShirtPage()));
                          },
                        )),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WomenTShirtPage()));
                  },
                ),
                Divider(
                  thickness: 3,
                ),
              ],
              ),
              Divider(
                thickness: 3,
              ),
              ExpansionTile(
                expandedAlignment: Alignment.topLeft,
                title: Text(
                  "HEADSCARF",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                children: [
                  /*Divider(
                    thickness: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          child: Text("Shawl",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShawlPage()));
                          },
                        )),
                  ),*/
                  Divider(
                    thickness: 3,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            child: Text("Cotton Shawl",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CottonShawlPage()));
                            },
                          )),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CottonShawlPage()));
                    },
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            child: Text("Combed Cotton Shawl",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CombedCottonShawlPage()));
                            },
                          )),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CombedCottonShawlPage()));
                    },
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            child: Text("Medine Silk Shawl",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MedineSilkShawlPage()));
                            },
                          )),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedineSilkShawlPage()));
                    },
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            child: Text("Scarf",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScarfPage()));
                            },
                          )),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScarfPage()));
                    },
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            child: Text("Turban",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TurbanPage()));
                            },
                          )),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TurbanPage()));
                    },
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            child: Text("Bonnet",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BonnetPage()));
                            },
                          )),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BonnetPage()));
                    },
                  ),
                  Divider(
                    thickness: 3,
                  ),
                ],
              ),
              Divider(
                thickness: 3,
              ),
              ExpansionTile(
                expandedAlignment: Alignment.topLeft,
                title: Text(
                  "OUTER CLOTHING",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                children: [
                  /*Divider(
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      child: Text("Clothes",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      onPressed: () {},
                    )),
              ),*/
                  Divider(
                    thickness: 3,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            child: Text("Abaya",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AbayaPage()));
                            },
                          )),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AbayaPage()));
                    },
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            child: Text("Kimono",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => KimonoPage()));
                            },
                          )),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KimonoPage()));
                    },
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            child: Text("Poncho",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PonchoPage()));
                            },
                          )),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PonchoPage()));
                    },
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            child: Text("Jacket",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JacketPage()));
                            },
                          )),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JacketPage()));
                    },
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            child: Text("Raincoat",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RaincoatPage()));
                            },
                          )),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RaincoatPage()));
                    },
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            child: Text("Coat",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CoatPage()));
                            },
                          )),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoatPage()));
                    },
                  ),
                ],
              ),
              Divider(
                thickness: 3,
              ),
              ExpansionTile(
                expandedAlignment: Alignment.topLeft,
                title: Text(
                  "CHOES&BAGS",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                children: [
                  /*Divider(
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      child: Text("Clothes",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      onPressed: () {},
                    )),
              ),*/
                  ExpansionTile(
                    title: Text(
                      "Choes",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    children: [
                      Divider(
                        thickness: 3,
                      ),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                child: Text("Sneakers",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SneakersPage()));
                                },
                              )),
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SneakersPage()));
                        },
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                child: Text("Ballerinas",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BallerinasPage()));
                                },
                              )),
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BallerinasPage()));
                        },
                      ),
                      Divider(
                        thickness: 3,
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text(
                      "Bag",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    children: [
                      Divider(
                        thickness: 3,
                      ),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                child: Text("Shoulder Bag",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ShoulderBagPage()));
                                },
                              )),
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShoulderBagPage()));
                        },
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                child: Text("Backpack",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => BackpackPage()));},
                              )),
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BackpackPage()));
                        },
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                child: Text("Handbag",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HandBagPage()));
                                },
                              )),
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HandBagPage()));
                        },
                      ),
                      Divider(
                        thickness: 3,
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
          Divider(thickness: 3,),
          ExpansionTile(
              title: Text("KIDS", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),),
            children: [
              Divider(thickness: 3,),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        child: Text("Baby Clothes",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BabyClothesPage()));
                        },
                      )),
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BabyClothesPage()));
                },
              ),
              Divider(
                thickness: 3,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        child: Text("Children Clothes",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChildrenClothesPage()));
                        },
                      )),
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChildrenClothesPage()));
                },
              ),
              Divider(
                thickness: 3,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        child: Text("Children Shoes",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChildrenShoesPage()));
                        },
                      )),
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChildrenShoesPage()));
                },
              ),
              Divider(
                thickness: 3,
              )
            ],
          ),
          Divider(
            color: Colors.white,
            thickness: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                children: [
                  Divider(
                    thickness: 3,
                    color: Colors.white,
                  ),
                  Icon(
                    IconlyLight.home,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    // style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavBar(selectedIndex: 0)));
                //Navigator.pushNamed(context, "/home");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.heart,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'WishList',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    // style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavBar(selectedIndex: 1)));
                //Navigator.pushNamed(context, "/wishlist");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                children: [
                  Icon(
                    IconlyLight.buy,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Carts',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    // style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavBar(selectedIndex: 2)));
                //Navigator.pushNamed(context, "/cart");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                children: [
                  Icon(
                    IconlyLight.bag2,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Orders',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    // style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrderPage()));
                //Navigator.pushNamed(context, "/my-order");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                children: [
                  Icon(
                    IconlyLight.profile,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    // style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNavBar(selectedIndex: 3)));
                //Navigator.pushNamed(context, "/profile");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Row(
                children: [
                  Icon(
                    IconlyLight.logout,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    // style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/signin", (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
