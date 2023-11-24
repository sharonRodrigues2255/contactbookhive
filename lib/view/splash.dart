import 'package:flutter/material.dart';
import 'package:flutter_application_7/view/homepage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splashNavigation(context);
    return Scaffold(
      body: Center(
          child: Container(
        height: 80,
        width: 80,
        child: Icon(
          Icons.shopping_bag,
          color: Colors.blue,
          size: 40,
        ),
      )),
    );
  }
}

splashNavigation(BuildContext context) async {
  Future.delayed(Duration(seconds: 2)).then((value) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => Homepage())));
}
