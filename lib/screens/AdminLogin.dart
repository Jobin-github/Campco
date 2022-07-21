import 'package:campco2/screens/adminhome.dart';
import 'package:campco2/screens/home.dart';
import 'package:campco2/screens/signup.dart';
import 'package:campco2/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:campco2/reusable_widgets/reusable_widgets.dart';
import 'package:campco2/screens/signup.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override

  // State<AdminLogin> createState() => _AdminLoginState();
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("ffff"),
          hexStringToColor("ffff")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 46),
            child: Column(
              children: <Widget>[
                //logoWidget("assets/images/logo1.png"),
                // ],
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Admin Email", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 30,
                ),

                reusableTextField("Admin Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),

                const SizedBox(
                  height: 5,
                ),
                loginUIButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const AdminHome()));
                  }).onError((error, stackTrace) {
                    print("error ${error.toString()}");
                  });
                }),
               
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
