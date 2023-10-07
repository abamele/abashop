import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController controller;
  int slideIndex = 0;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 12.0 : 8.0,
      width: isCurrentPage ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFFF58D84) : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: EdgeInsets.only(top: 80),
          children: [
            Container(
              alignment: Alignment.center,
              child: Text("Welcome to abashop", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text("We offer the best products at the wor"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ClipRect(
                child:  Image.asset("assets/Group 76.png", fit: BoxFit.cover,)

            ),
            SizedBox(
              height: 80,
            ),
            Container(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: blueColor, minimumSize: Size(290, 50)),
                    onPressed: () {
                      //controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                      Navigator.pushNamedAndRemoveUntil(context, "/signin", (route) => false);
                    },
                    child: Container(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, minimumSize: Size(290, 50)),
                    onPressed: () {
                      //controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                      Navigator.pushNamedAndRemoveUntil(context, "/signup", (route) => false);
                    },
                    child: Container(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}