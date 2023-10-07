import 'package:abashop/Aba-Shop/screens/signup/signup-page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/user-model.dart';
import '../../providers/user-provider.dart';
import '../../services/auth-service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  Users _users = new Users();
  Authentication _authentication = new Authentication();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showPassword = true;
  bool _isLoading = false;

/*  // initstate
  @override
  void initState() {
    AuthNotifier authNotifier =
    Provider.of<AuthNotifier>(context, listen: false);
    // initialize current user
    _authentication.initializeCurrentUser(authNotifier);
    super.initState();
  }*/

  void toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      gravity: ToastGravity.BOTTOM,
    );
  }

  // submit form
  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    RegExp regExp = new RegExp(
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');
    if (!regExp.hasMatch(_users.email!)) {
      // toast
      //toast("Enter a valid Email ID");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: crimsonColor,
          content: Text(
            "Enter AValid EmailID",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else if (_users.password!.length < 8) {
      //toast('Password must have atleast 8 characters');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: crimsonColor,
          content: Text(
            'Password Must Have 8 Characters',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } else {
      _authentication.login(_users, authNotifier, context);
    }
  }

  void _onRememberMeChanged(bool? newValue) => setState(() {
        rememberMe = newValue!;
        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        leading: null,
        centerTitle: true,
        toolbarHeight: 230.0,
        backgroundColor: blueColor,
        elevation: 0.0,
        title: ClipRect(
          child: Image.asset("assets/rafiki.png"),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
          color: Colors.white,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field Is Required';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newvalue) {
                      _users.email = newvalue;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        hintText: "E-mail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    obscureText: showPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field Is Required';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (newvalue) {
                      _users.password = newvalue;
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(
                              (showPassword)
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            }),
                        hintText: "password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: rememberMe,
                                      onChanged: _onRememberMeChanged),
                                  Text("Remamber Me")
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 20),
                          child: TextButton(
                            child: Text("Forgot Password"),
                            onPressed: () {
                              Navigator.pushNamed(context, "/forgot_password");
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: blueColor,
                      minimumSize: Size(310, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      _submitForm();
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account",
                      style: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 17,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => SignupPage()),
                                (route) => false);
                      },
                      child: Text(
                        "Here",
                        style: TextStyle(
                            color: blueColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Opensans'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
