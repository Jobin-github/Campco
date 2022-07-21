import 'package:campco2/screens/PSocieties/CSI.dart';
import 'package:campco2/screens/addevent.dart';
import 'package:campco2/screens/event1.dart';
import 'package:campco2/screens/event2.dart';
import 'package:campco2/screens/home.dart';
import 'package:campco2/screens/login.dart';
import 'package:campco2/screens/profile.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:campco2/screens/reg.dart';
import 'package:campco2/screens/register.dart';
import 'package:campco2/screens/thankyou.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CAMPCO',
      theme: ThemeData.dark(
        
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      
      ),
      home: SplashScreen(
      )
    );
    
  }
}
class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    const login()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,

            colors: [Color.fromARGB(255, 27, 27, 28),Color.fromARGB(255, 11, 11, 11),]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  
                  "assets/CampCO-logo-on-white-523025105.png",
                  height: 400.0,
                  width: 400.0,
                ),
                Container(
                  child: Text("Every Event at your fingertips",textAlign:TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ],
            ),
              Container(
                  child: Text("LOADING...",textAlign:TextAlign.center,
                    style: TextStyle(
                      
                      color: Colors.white,
                      fontFamily: 'RobotoMono' ,
                      fontSize: 18.0,
                    ),
                  ),
                ),
            CircularProgressIndicator( 
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

