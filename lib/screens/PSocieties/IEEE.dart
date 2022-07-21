import 'package:campco2/screens/reg.dart';
import 'package:campco2/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class IEEE extends StatefulWidget {
  const IEEE({Key? key}) : super(key: key);

  @override
  _IEEEState createState() => _IEEEState();
}

class _IEEEState extends State<IEEE> {
 
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getUserInfo() async {
    return FirebaseFirestore.instance.collection('events').snapshots();
  }

  //String n = getUserInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
        title: const Text(
          "IEEE",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 28,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/IEEELogo.png'
                
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              ),
            ),
           
           
            Container(
                                  height: 165,
                                  width: double.infinity,
      
                                  child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('astra')
                                        .snapshots(),
                                    builder: (context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.separated(
                                          itemCount: snapshot.data!.docs.length,
                                          //controller: scrollController,
                                          physics:
                                              RangeMaintainingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (ctx, index) {
                                            return Container(
                                              //height: ,
                                              child: ListTile(
                                          
                                                subtitle: Text(
                                                  snapshot.data!.docs[index]
                                                      ['Description_astra'],
                                                  style: GoogleFonts.poppins(
                                                      color: Color.fromARGB(
                                                          255, 170, 170, 170),
                                                      fontSize: 13),
                                                ),
                                                  // leading: CircleAvatar(
                                                  //   radius: 25,
                                                  //   backgroundImage: AssetImage(
                                                  //       'assets/Event-PNG-Image.png'),
                                                  // ),
                                                // trailing: Icon(
                                                //   Icons.favorite_rounded,
                                                //   color: Colors.red,
                                                // ),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (ctx, index) {
                                            return Divider(
                                              color: Color.fromARGB(
                                                  42, 255, 255, 255),
                                            );
                                          },
                                        );
                                      } else {
                                        return Container();
                                      }
                                    },
                                  ),
                                ),
            GestureDetector(
              // onTap: () async {
              //   await Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => signup1(), // The page you want
              //     ),
              //   );
              // },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  "Events",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget storageWidget(isSelected, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        width: 75,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          border: Border.all(color: Colors.white, width: isSelected ? 2 : 0),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
