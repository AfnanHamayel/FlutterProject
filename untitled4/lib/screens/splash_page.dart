import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/screens/login_page.dart';
import 'package:untitled4/screens/main_screen.dart';
import 'package:untitled4/utl/constant_value.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Logo"),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkUserIsLogin();
  }

  checkUserIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString(ConstantValue.ID) ?? "";
    print("starts id ${userId}");

    if (userId == "") {
      Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => LoginPage())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => MainScreen())));
    }
  }
}
