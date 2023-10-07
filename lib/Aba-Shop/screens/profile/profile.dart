import 'package:abashop/Aba-Shop/providers/profile-provider.dart';
import 'package:abashop/Aba-Shop/screens/profile/profile-edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../widgets/text/text-widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                        text: "firstname",
                        color: Colors.black,
                        textSize: 18,
                        isTile: true,
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        "email",
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
              title: Text("addresse"),
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
                              profileDataProvider: ProfileDataProvider(),
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
              Navigator.pushNamed(context, "/your-order");
            },
          ),
          ListTile(
            title: TextWidget(
              text: "favourites",
              color: Colors.black,
              textSize: 22,
            ),
            leading: Icon(CupertinoIcons.heart),
            trailing: Icon(IconlyLight.arrowRight2),
            onTap: () {
              Navigator.pushNamed(context, "/wishlist");
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
              Navigator.pushNamed(context, "/cart");
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
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(""),
          )
        ],
      ),
    );
  }
}
