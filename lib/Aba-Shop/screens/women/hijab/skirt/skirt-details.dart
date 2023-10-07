import 'package:abashop/Aba-Shop/models/product-model.dart';
import 'package:abashop/Aba-Shop/screens/carts/cart-page.dart';
import 'package:abashop/Aba-Shop/widgets/navbar/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../../../providers/cart-provider.dart';
import '../../../../widgets/text/text-widget.dart';

class SkirtDetails extends StatefulWidget {
  SkirtDetails({super.key, required this.productModel});
  ProductModel productModel;
  @override
  State<SkirtDetails> createState() => _SkirtDetailsState();
}

class _SkirtDetailsState extends State<SkirtDetails> {
  final ValueNotifier<String> selectButton = ValueNotifier<String>('');

  double rating = 3.5;

  List<String> imageUrls = [
    "https://www.kevserinmutfagi.com/wp-content/uploads/2020/02/kabune3-600x400.jpg",
    "https://cdn.yemek.com/mnresize/1250/833/uploads/2023/01/kusursuz-izmir-kofte-yemekcom.jpg",
    "https://cdn.yemek.com/mnresize/1250/833/uploads/2016/09/kozalak-manti-asama-10.jpg",
    // Diğer resim URL'leri buraya ekleyin
  ];
  List<String> txt = ["S", "M", "L", "XL", "2XL"];
  int currentIndex = 0;
  PageController _pageController = PageController();

  void _previousImage() {
    if (currentIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextImage() {
    if (currentIndex < widget.productModel.productImage!.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  bool _isLoading = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProd = Provider.of(context);
    cartProd.getCartData();

    List<Widget> _starList = [];
    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        _starList.add(Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ));
      } else if (i == realNumber) {
        _starList.add(SizedBox(
            width: 18,
            height: 18,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),
                ClipRect(
                  clipper: _Clipper(part: partNumber),
                  child: Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 18,
                  ),
                )
              ],
            )));
      } else {
        _starList.add(Icon(
          Icons.star,
          color: Colors.grey,
          size: 18,
        ));
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
              await Navigator.pushNamed(context, "/profile");
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
              await Navigator.pushNamed(context, "/wishlist");
            },
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 8.0),
              child: Center(
                child: FlutterBadge(
                  itemCount: cartProd.cartCounter,
                  icon: Icon(
                    CupertinoIcons.cart,
                    size: 30,
                  ),
                ),
              ),
            ),
            onTap: () async {
              await Navigator.pushNamed(context, "/cart");
            },
          ),
        ],
      ),
      drawer: NavberWidget(),
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 400,
                child: PageView.builder(
                    itemCount: widget.productModel.productImage?.length,
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.only(left: 40, right: 40, top: 10),
                          child: Image.network(widget.productModel.productImage![index],)
                        //Image.network(imageUrls[index],),
                      );
                    }),
              ),
              Positioned(
                top: 170,
                left: 1, // Geri butonunun pozisyonunu ayarlayın
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 30,
                  ),
                  onPressed: _previousImage,
                  color: Colors.blue,
                ),
              ),
              Positioned(
                top: 170,
                right: 1, // İleri butonunun pozisyonunu ayarlayın
                child: IconButton(
                  icon: Icon(
                    Icons.chevron_right,
                    size: 30,
                  ),
                  onPressed: _nextImage,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(
              height: 10), // Resim ve küçük resim arasındaki boşluğu ayarlayın
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.productModel.productImage!.map((url) {
              int index = widget.productModel.productImage!.indexOf(url);
              return Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == currentIndex ? Colors.blue : Colors.grey,
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 40,
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${widget.productModel.productDescription}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: _starList,
                      ),
                      Text("(1723)")
                    ],
                  ),
                ),
                Text(
                  "",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "\$${widget.productModel.productOriginalPrice}",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "",
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                Text(
                  "",
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Size:",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Row(
                              children: [
                                Text(
                                  "Size Chart",
                                ),
                                Icon(Icons.chevron_right)
                              ],
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Image(
                                        image: AssetImage("assets/size.png"),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: txt.asMap().entries.map((entry) {
                          final int index = entry.key;
                          final String item = entry.value;

                          return filtreTextWidget(index, item);
                        }).toList(),
                      ),
                    )
                  ],
                ),
                Text(
                  "",
                ),
                Divider(
                  thickness: 3,
                ),
                Text(
                  "",
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Seller:",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        "Abashop",
                      ),
                    ),
                    Icon(
                      Icons.check_circle,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
                Text(
                  "",
                ),
                Divider(
                  thickness: 3,
                ),
                Text(
                  "",
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 15),
                        child: Icon(
                          FontAwesomeIcons.truck,
                          color: Colors.grey,
                        )),
                    Flexible(
                      child: RichText(
                        text: const TextSpan(
                          text: '23 saat 9 dakika içinde',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: [
                            WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 10)),
                            TextSpan(
                                text: 'sipariş verirsen en geç',
                                style: TextStyle(color: Colors.grey)),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: SizedBox(width: 10)),
                            TextSpan(
                                text: 'Yarın Kargoda!',
                                style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  "",
                ),
              ],
            ),
          ),

          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Product Info",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    Flexible(
                        child:
                        Text("Bu ürün Abashop tarafından gönderilecektir")),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    Flexible(
                        child: Text(
                            "Kampanya fiyatından satılmak üzere 100 adetten fazla stok sunulmuştur.")),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    Flexible(
                        child: Text(
                            "Modelin Ölçüleri: Boy: 1.77 Göğüs: 79 Bel: 69 Kalça: 89")),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    Flexible(
                        child:
                        Text("Bu ürün Abashop tarafından gönderilecektir")),
                  ],
                ),
                Text("")
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Product Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Waist:",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${widget.productModel.waist}",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: greyWhiteColor,
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Tissue Type:",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${widget.productModel.tissue_type}",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Age:",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "25",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: greyWhiteColor,
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Color:",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${widget.productModel.color}",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Thickness:",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.productModel.thickness}",
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        child: Text("View",
                            style: TextStyle(color: Colors.blue, fontSize: 18)),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          "Product Details",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Card(
                                        color: greyWhiteColor,
                                        elevation: 0.0,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Waist:",
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${widget.productModel.waist}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: Colors.white,
                                        elevation: 0.0,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Tissue Type:",
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${widget.productModel.tissue_type}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: greyWhiteColor,
                                        elevation: 0.0,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Age:",
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "25",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: Colors.white,
                                        elevation: 0.0,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Color:",
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${widget.productModel.color}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: greyWhiteColor,
                                        elevation: 0.0,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Thickness:",
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${widget.productModel.thickness}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: Colors.white,
                                        elevation: 0.0,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Collar Type:",
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${widget.productModel.collarType}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: greyWhiteColor,
                                        elevation: 0.0,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Arm Lenght:",
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${widget.productModel.armLenght}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: Colors.white,
                                        elevation: 0.0,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Sustainable Detail:",
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${widget.productModel.sustainableDetail}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: greyWhiteColor,
                                        elevation: 0.0,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Mold:",
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${widget.productModel.mold}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: Colors.white,
                                        elevation: 0.0,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Pattern:",
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${widget.productModel.pattern}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: greyWhiteColor,
                                        elevation: 0.0,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Text(
                                                  "Collection:",
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${widget.productModel.collection}",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "\$${widget.productModel.productOriginalPrice}",
                    color: Colors.black,
                    textSize: 22,
                    isTile: true,
                  ),
                  Text(
                    "Kargo Bedava",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: MaterialButton(
                height: 55,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _isLoading
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Loading...",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            backgroundColor: Colors.blueAccent,
                          ),
                        ),
                      ],
                    )
                        : TextWidget(
                      text: "Add To Cart",
                      color: Colors.white,
                      textSize: 17,
                      isTile: true,
                    ),
                  ],
                ),
                color: blueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                onPressed: () async {
                  if (selectButton.value.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Size required."),
                      backgroundColor: Colors.red,
                    ));
                    return;
                  } else {
                    final QuerySnapshot querySnapshot = await FirebaseFirestore
                        .instance
                        .collection('Carts')
                        .doc(FirebaseAuth.instance.currentUser?.uid)
                        .collection("YourCarts")
                        .where('productId',
                        isEqualTo: widget.productModel.productId)
                        .get();
                    if (querySnapshot.docs.isEmpty) {
                      setState(() {
                        _isLoading = true;
                      });

                      Future.delayed(Duration(seconds: 3), () async {
                        cartProd.addCartData(
                            productId: widget.productModel.productId,
                            productImage: widget.productModel.productImage,
                            productDescription:
                            widget.productModel.productDescription,
                            productOriginalPrice:
                            widget.productModel.productOriginalPrice,
                            isChecked: true,
                            orderQte: 1,
                            selectedSize: selectButton.value,
                            totalUnit: widget.productModel.totalUnit);
                        _isLoading = false;
                      }).then((value) async => await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartPage(
                                  isVisible: widget.productModel.isChecked))));
                    } else {
                      Fluttertoast.showToast(
                        msg: "this product already exist",
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget filtreTextWidget(int index, String txt) {
    return ValueListenableBuilder<String>(
      valueListenable: selectButton,
      builder: (BuildContext context, String selectedSize, Widget? child) {
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              width: 60,
              decoration: BoxDecoration(
                color: selectedSize == txt ? Colors.blue : Colors.white,
                border: Border.all(),
              ),
              child: Center(
                child: Text(
                  txt,
                  style: TextStyle(
                    color: selectedSize == txt ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            selectButton.value = txt;
            print("Seçilen Boyut: $txt");
          },
        );
      },
    );
  }
}

//for double rating=3.5=>5
class _Clipper extends CustomClipper<Rect> {
  final int part;
  _Clipper({required this.part});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
        (size.width / 10) * part, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}


