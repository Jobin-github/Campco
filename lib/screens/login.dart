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

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override

  // State<login> createState() => _loginState();
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.black),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 46),
                
            child: Column(
              children: <Widget>[
                //logoWidget("assets/images/logo1.png"),
                // ],
                Image.asset(
                      
                      "assets/CampCO-logo-on-white-523025105.png",
                      width: 500,
                      height: 150,
                    ),
                
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter email address", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 30,
                ),

                reusableTextField("Enter Password (min 6 characters)", Icons.lock_outline, true,
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
                        MaterialPageRoute(builder: (context) => ScreenHome()));
                  }).onError((error, stackTrace) {
                    print("error ${error.toString()}");
                  });
                }),
               
                signUpOption(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row signUpOption(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have account?",
          style: TextStyle(color: Colors.white70)),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => signup()));
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );

 

  
}
