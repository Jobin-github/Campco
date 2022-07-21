import 'package:campco2/screens/retrieve.dart';
import 'package:campco2/screens/thankyou.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signup1 extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String user_name = '';
  String user_collegeid = '';
  String user_mail = '';
  String user_dept = '';
  String user_year = '';
  //signup1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 24, 24),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
        title: const Text(
          "Enter Your Details",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.favorite_border,
            color: Colors.black,
            size: 28,
          ),
          SizedBox(
            width: 10,
          )
        ],
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  user_name = value;
                },
                decoration: InputDecoration(
                  labelStyle:TextStyle(color: Colors.white),
          fillColor: Colors.white,
          enabledBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
                  labelText: 'Name'
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  user_collegeid = value;
                },
                decoration: InputDecoration(
                  labelStyle:TextStyle(color: Colors.white),
          fillColor: Colors.white,
          enabledBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        labelText: 'CollegeID'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
              style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  user_mail = value;
                },
                decoration: InputDecoration(
                  labelStyle:TextStyle(color: Colors.white),
          fillColor: Colors.white,
          enabledBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),labelText: 'Mail'),
                
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  user_dept = value;
                },
                decoration: InputDecoration(labelStyle:TextStyle(color: Colors.white),
          fillColor: Colors.white,
          enabledBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),labelText: 'Department'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  user_year = value;
                },
                decoration: InputDecoration(
                  labelStyle:TextStyle(color: Colors.white),
          fillColor: Colors.white,
          enabledBorder:OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),labelText: 'Year of Study'),
                
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150,70),
          primary: Colors.black, // background
          onPrimary: Colors.white, // foreground
        ),
              onPressed: () async {
                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const ThankYouPage(title: "thank You",)));
                  await users.add({
                    'Name': user_name,
                    'CollegeID': user_collegeid,
                    'Mail': user_mail,
                    'Department': user_dept,
                    'Year of Study' : user_year
                  }).then((value) => print('updated'));
                },
                
              // child: GestureDetector(
              //   onTap: (){
              //                             Navigator.push(context,
              //                   MaterialPageRoute(builder: (context) => const retrieve()));
              //                           },
                child: const Text('REGISTER',
                  style: TextStyle(fontSize: 22 ,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255)),
                  ),
              ),
           // )
          ],
        ),
      ),
    );
  }
}
Widget storageWidget(isSelected, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        width: 75,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Color(0xfffD1C0F4),
          border: Border.all(color: Colors.white, width: isSelected ? 2 : 0),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.white),
        ),
      ),
    );
  }