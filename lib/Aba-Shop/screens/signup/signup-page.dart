import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/user-model.dart';
import '../../providers/user-provider.dart';
import '../../services/auth-service.dart';
import '../signin/signin-page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Users _users = new Users();
  Authentication _authentication = new Authentication();

  bool showPassword = true;
  bool showConfirmPassword = true;
  final TextEditingController _passwordController = new TextEditingController();

  void toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void _submitForm() {
    //var s = _users.password;
    /*if (s != null) {
      var len = s.length; // Safe
    }*/
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    RegExp regExp = new RegExp(
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    if (_users.fullName!.length < 3) {
      toast("Name must have atleast 3 characters");
    } else if (!regExp.hasMatch(_users.email!)) {
      toast("Warning! Enter a valid Email ID");
    } else if (_users.password!.length < 8) {
      toast("Password must have atleast 8 characters");
    } else if (_passwordController.text.toString() != _users.password) {
      toast("Confirm password does'nt match your password");
    } else {
      _users.role = 'user';
      _authentication.signup(_users, authNotifier, context);
      print("Success");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: blueColor,
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
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Full Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field Is Required';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (newValue) {
                      _users.fullName = newValue!;
                    },
                    keyboardType: TextInputType.name,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "E-mail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field Is Required';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (newValue) {
                      _users.email = newValue!;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
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
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                        hintText: "Confirme Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field Is Required';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (newvalue) {
                      _passwordController.text = newvalue!;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: "Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field Is Required';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (newvalue) {
                      _users.address = newvalue!;
                    },
                  ),
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
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    child: Text("Forgot Password"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/forgot_password");
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have An Account",
                      style: const TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 17,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                                (route) => false);
                      },
                      child: Text(
                        "Login Here",
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
