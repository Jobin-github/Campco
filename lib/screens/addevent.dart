import 'package:campco2/screens/retrieve.dart';
import 'package:campco2/screens/thankadmin.dart';
import 'package:campco2/screens/thankyou.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addevent extends StatelessWidget {
  CollectionReference events = FirebaseFirestore.instance.collection('events');
  String admin_eventName = '';
  String admin_eventDescription = '';
  String admin_category = '';
  String admin_Date = '';
  String admin_eventID = '';
  String admin_Price = '';
  //signup1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 24, 24),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
        title: const Text(
          "Enter Event Details",
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
                  admin_eventName = value;
                },
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Event Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  admin_Price = value;
                },
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Price'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  admin_eventDescription = value;
                },
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Event Description'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  admin_category = value;
                },
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Category'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  admin_Date = value;
                },
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Date'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  admin_eventID = value;
                },
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Event ID'),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(150, 70),
                primary: Colors.black, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThankAdmin(
                              title: 'H',
                            )));
                await events.add({
                  'Event Name': admin_eventName,
                  'Event Description': admin_eventDescription,
                  'Category': admin_category,
                  'Date': admin_Date,
                  'Event ID': admin_eventID,
                  'Price' : admin_Price,
                }).then((value) => print('event details updated'));
              },

              // child: GestureDetector(
              //   onTap: (){
              //                             Navigator.push(context,
              //                   MaterialPageRoute(builder: (context) => const retrieve()));
              //                           },
              child: const Text(
                'UPDATE',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
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
