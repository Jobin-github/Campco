import 'package:campco2/screens/home.dart';
import 'package:campco2/screens/navscreen.dart';
import 'package:flutter/material.dart';
import 'info_card.dart';

// our data

const email = "test1@gmail.com";
const phone = "+91"; // not real number :)
const location = "SJCET";

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 5, 5, 5),
        body: SafeArea(
          //minimum: const EdgeInsets.only(top: 100),
          child: Column(
            
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(onPressed: (){
                  Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const ScreenHome()));
                }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
              ),
              SizedBox(height:100),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/clipart-profile-15.jpg'),
              ),
              const Text(
                "User1",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                ),
              ),
              const Text(
                "19cs062",
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 238, 239, 239),
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Source Sans Pro"),
              ),
              const SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),

              // we will be creating a new widget name info carrd

              InfoCard(text: phone, icon: Icons.phone, onPressed: () async {}),
              InfoCard(
                  text: location,
                  icon: Icons.location_city,
                  onPressed: () async {}),
              InfoCard(text: email, icon: Icons.email, onPressed: () async {}),
           
          
            ],
          
          ),
  
        ));
  }
}