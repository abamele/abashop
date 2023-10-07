import 'package:abashop/Aba-Shop/constants/colors.dart';
import 'package:abashop/Aba-Shop/providers/profile-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:provider/provider.dart';

import '../../providers/cart-provider.dart';
import '../../widgets/bottom-app-bar/bottom-nav-bar.dart';
import '../../widgets/navbar/navbar.dart';
import '../../widgets/text/text-widget.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key, required this.profileDataProvider}) : super(key: key);
  ProfileDataProvider profileDataProvider;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    cartProvider.getCartData();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        elevation: 0.0,
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
                      builder: (context) => BottomNavBar(selectedIndex: 3)));
              ;
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
                      builder: (context) => BottomNavBar(selectedIndex: 1)));
              ;
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
                      builder: (context) => BottomNavBar(selectedIndex: 2)));
              ;
            },
          ),
        ],
      ),
      drawer: NavberWidget(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.chevron_back,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/profile");
                    },
                  ),
                  Expanded(
                    child: ListTile(
                      title: Center(
                        child: TextWidget(
                          text: "account Information",
                          color: Colors.black,
                          textSize: 20,
                          isTile: true,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/profile");
                      },
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("fullame",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: greyWhiteColor),
                                    child: TextFormField(
                                      initialValue: widget.profileDataProvider
                                          .currentData?.fullName,
                                      cursorColor: kPrimaryColor,
                                      decoration: InputDecoration(
                                          hintText: "fullName",
                                          hintStyle: const TextStyle(
                                              fontFamily: 'OpenSans'),
                                          border: OutlineInputBorder()),
                                      validator: (value) {
                                        return null;
                                      },
                                      onSaved: (newValue) {
                                        widget.profileDataProvider.currentData
                                            ?.fullName = newValue;
                                      },
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(color: greyWhiteColor),
                              child: TextFormField(
                                initialValue: widget
                                    .profileDataProvider.currentData?.email,
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(
                                    hintText: "email",
                                    hintStyle:
                                        const TextStyle(fontFamily: 'OpenSans'),
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  return null;
                                },
                                onSaved: (newValue) {
                                  widget.profileDataProvider.currentData
                                      ?.email = newValue;
                                },
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "address",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: greyWhiteColor),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                initialValue: widget
                                    .profileDataProvider.currentData?.address,
                                cursorColor: kPrimaryColor,
                                maxLines: 4,
                                decoration: InputDecoration(
                                    hintText: "address",
                                    hintStyle:
                                        const TextStyle(fontFamily: 'OpenSans'),
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  return null;
                                },
                                onSaved: (newValue) {
                                  widget.profileDataProvider.currentData
                                      ?.address = newValue;
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: size.width * 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: newElevatedButton(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateUserProfile(context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await widget.profileDataProvider
          .updateUserData(
            userId: widget.profileDataProvider.currentUserData?.userId,
            fullName: widget.profileDataProvider.currentUserData?.fullName,
            email: widget.profileDataProvider.currentUserData?.email,
            address: widget.profileDataProvider.currentUserData?.address,
          ).then((value) => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Updated Success",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey),
                              child: Text(
                                "close",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }));
    }
  }

  Widget newElevatedButton() {
    return ElevatedButton(
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
                    CircularProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.blueAccent,
                    ),
                  ],
                )
              : TextWidget(
                  text: "Update",
                  color: Colors.white,
                  textSize: 17,
                  isTile: true,
                ),
        ],
      ),
      style: ElevatedButton.styleFrom(
          primary: Colors.deepOrangeAccent,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans')),
      onPressed: () {
        setState(() {
          _isLoading = true;
        });
        Future.delayed(Duration(seconds: 3), () {
          setState(() {});
          updateUserProfile(context);
          _isLoading = false;
        });
      },
    );
  }
}
