// ignore_for_file: prefer_const_constructors



import 'package:campco2/screens/adminhome.dart';
import 'package:campco2/screens/home.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class ThankAdmin extends StatefulWidget {
  const ThankAdmin({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ThankAdmin> createState() => _ThankAdminState();
}

Color themeColor = const Color(0xFF43D19E);

class _ThankAdminState extends State<ThankAdmin> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "assets/card.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Completed!",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "The Event was added Successfully",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "You will be redirected to the home page shortly\nor click here to return to home page",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Flexible(
              child: HomeButton(
                title: 'Home',
                onTap: () {Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdminHome(), // The page you want
          ),
        );},
              ),
            ),
          ],
        ),
      ),
    );
  }
}