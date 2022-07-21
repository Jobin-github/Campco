import 'dart:convert';
import 'dart:async' show Future;
import 'package:campco2/screens/Adminslidebar.dart';
import 'package:campco2/screens/addevent.dart';
import 'package:campco2/screens/event2.dart';
import 'package:campco2/screens/event3.dart';
import 'package:campco2/screens/navscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;
// import 'package:firebase_signin/screens/signin_screen.dart';
import 'event1.dart';



class User {
  final String name;
  final String location;

  User({
    required this.name,
    required this.location,
  });
  // factory User.fromJson(Map<String, dynamic> parsedJson) {
  //   return User(name: parsedJson['name'], location: parsedJson['location']);
  // }
}


class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();

}

class _AdminHomeState extends State<AdminHome> {
  TextEditingController searchController = TextEditingController();
  List<User> users = [];
  List<User> users2 = [];
  late Future<dynamic> futureData;
  @override
  void initState() {
    super.initState();
    // futureData = shopdetails();
  }

  // @override
  // void didChangeDependencies() {
  //   shopdetails();
  //   super.didChangeDependencies();
  // }

  // bool isLoading = false;
  // Future shopdetails() async {
  //   var url1 = "http://34.211.11.191:8080/shops";
  //   final Uri url = Uri.parse(url1);
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var responseData = json.decode(response.body);
  //     //List<User> resusers = [];
  //     for (var u in responseData) {
  //       //print(u);
  //       users.add(User(name: u["name"], location: u["location"]));
  //       // print(users);
  //       // User user = User(name: u["name"], location: u["location"]);
  //       // users.add(user);
  //     }

  //     // return User.fromJson(jsonDecode(response.body)['name']['location']);
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

  // Future searchshop(String shopName) async {
  //   var url2 = "http://34.211.11.191:8080/shop/search/$shopName";
  //   final Uri url = Uri.parse(url2);
  //   var response2 = await http.get(url);
  //   if (response2.statusCode == 200) {
  //     var responseData2 = json.decode(response2.body);
  //     // List<User> resusers2 = [];
  //     for (var u in responseData2) {
  //       print(u);
  //       users2.add(User(name: u["name"], location: u["location"]));
  //       // User user = User(name: u["name"], location: u["location"]);
  //       // users.add(user);
  //     }

  //     // return User.fromJson(jsonDecode(response.body)['name']['location']);
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  var images = [

     'assets/photo_2022-07-09_01-33-35.jpg',
     'assets/photo_2022-07-09_01-33-39.jpg',
     'assets/photo_2022-07-09_01-33-41.jpg'

  ];
  int activeIndex = 0;





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          key: _globalKey,
           drawer: Adminslidebar(),
          // appBar: AppBar(
          //   elevation: 0,
          //   title: Text(
          //     'Self Out',
          //     style: GoogleFonts.poppins(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 23,
          //     ),
          //   ),
          //   actions: [
          //     IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          //   ],
          //   //leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          //   backgroundColor: Color.fromARGB(255, 45, 45, 197),
          // ),
          backgroundColor: Color.fromARGB(255, 24, 24, 24),
          
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    //   SizedBox(
                    //     height: 31,
                    //   ),
                    Container(
                      width: double.infinity,
                      decoration:
                          BoxDecoration(color: Color.fromARGB(255, 33, 33, 35)),
                      height: 55,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: IconButton(
                                onPressed: () {
                                  _globalKey.currentState?.openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Campco',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Our Organizations',
                              style: GoogleFonts.lato(
                                  // fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(),
                          // child: TextButton(
                          //     onPressed: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) =>
                          //               const FavouritesScreen(),
                          //         ),
                          //       );
                          //     },
                          //     child: Text(
                          //       'see all',
                          //       style: GoogleFonts.montserrat(
                          //           fontWeight: FontWeight.bold,
                          //           color: Color.fromARGB(199, 186, 186, 186)),
                          //     )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 15),
                      child: Container(
                        height: 90,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topCenter,
                              //color: Colors.yellow,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0, left: 15, right: 15, top: 0),
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Astra()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          // border: Border.all(
                                          //   color: Colors.black,
                                          // ),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/1.png'),
                                              fit: BoxFit.fill),
                                          //color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                        width: 60,
                                        height: 60,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 0, top: 7),
                                    child: Container(
                                      //color: Colors.blue,
                                      //alignment: Alignment.,
                                      child: Text(
                                        'IEEE',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              //color: Colors.yellow,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0, left: 15, right: 15, top: 0),
                                         child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Insendium()));
                                      },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/CSI.png'),
                                            fit: BoxFit.cover),
                                        //color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Container(
                                      //color: Colors.blue,
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'CSI',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              //color: Colors.yellow,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0, left: 15, right: 15, top: 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/Tinkerhub.jpg'),
                                            fit: BoxFit.cover),
                                        //color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Container(
                                      //color: Colors.blue,
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Tinkerhub',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              //color: Colors.yellow,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0, left: 15, right: 15, top: 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/GDC.png'),
                                            fit: BoxFit.fill),
                                        //color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Container(
                                      //color: Colors.blue,
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'GDC',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              //color: Colors.yellow,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0, left: 15, right: 15, top: 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/Mozilla.png'),
                                            fit: BoxFit.fill),
                                        //color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Container(
                                      //color: Colors.blue,
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Mozilla SJCET',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Events',
                              style: GoogleFonts.lato(
                                  //fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'see all',
                                style: GoogleFonts.montserrat(
                                    color: Color.fromARGB(199, 186, 186, 186),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CarouselSlider.builder(
                          
                          itemCount: 3,
                          itemBuilder: (context, index, realindex) {
                            final im = images[index];
                            return buildImage(context,im, index);
                          },
                          options: CarouselOptions(
                            //aspectRatio: 2 / 1,
                            // enlargeCenterPage: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayCurve: Curves.easeIn,
                            height: 120,
                            enableInfiniteScroll: true,
                            autoPlay: false,
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                          ),
                        ),
                        SizedBox(height: 32),
                        buildIndicator(activeIndex),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              '',
                              style: GoogleFonts.lato(
                                  //fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(),
                          // child: TextButton(
                          //     onPressed: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => const BillScreen(),
                          //         ),
                          //       );
                          //     },
                          //     child: Text(
                          //       'see all',
                          //       style: GoogleFonts.montserrat(
                          //           fontWeight: FontWeight.bold,
                          //           color: Color.fromARGB(199, 186, 186, 186)),
                          //     )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 15, right: 15),
                    //   child: Container(
                    //     height: 100,
                    //     child: ListView(
                    //       scrollDirection: Axis.horizontal,
                    //       children: <Widget>[
                    //         GestureDetector(
                    //           onTap: () {
                    //             print(4);
                    //           },
                    //           child: Container(
                    //             width: 200,
                    //             decoration: BoxDecoration(
                    //                 color: Color.fromARGB(255, 103, 121, 131),
                    //                 borderRadius: BorderRadius.circular(10)),
                    //             child: Stack(
                    //               children: [
                    //                 ClipRRect(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   child: Image.asset(
                    //                     "assets/Flutter_logo_text.png",
                    //                     width: double.infinity,
                    //                     fit: BoxFit.cover,
                    //                   ),
                    //                 ),
                    //                 Positioned(
                    //                   right: 0,
                    //                   child: Container(
                    //                     decoration: BoxDecoration(
                    //                       borderRadius: BorderRadius.only(
                    //                           topLeft: Radius.circular(20),
                    //                           bottomLeft: Radius.circular(20),
                    //                           topRight: Radius.circular(10),
                    //                           bottomRight: Radius.circular(10)),
                    //                       color: Color.fromARGB(
                    //                           224, 255, 255, 255),
                    //                     ),
                    //                     child: Padding(
                    //                       padding:
                    //                           EdgeInsets.only(top: 30, left: 0),
                    //                       child: Column(
                    //                         children: [
                    //                           Text(
                    //                             "Flutter",
                    //                             style: GoogleFonts.montserrat(
                    //                                 fontWeight: FontWeight.bold,
                    //                                 fontSize: 26,
                    //                                 color: Colors.black),
                    //                             textAlign: TextAlign.center,
                    //                           ),
                    //                           Text(
                    //                             "Rs. free",
                    //                             style: GoogleFonts.montserrat(
                    //                                 fontWeight: FontWeight.w500,
                    //                                 fontSize: 16,
                    //                                 color: Color.fromARGB(
                    //                                     255, 0, 0, 0)),
                    //                             textAlign: TextAlign.center,
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     width: 100,
                    //                     height: 100,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 15,
                    //         ),
                    //         GestureDetector(
                    //           onTap: () {
                    //             print(3);
                    //           },
                    //           child: Container(
                    //             decoration: BoxDecoration(
                    //                 color: Color.fromARGB(255, 113, 142, 157),
                    //                 borderRadius: BorderRadius.circular(10)),
                    //             width: 200,
                    //             child: Stack(
                    //               children: [
                    //                 ClipRRect(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   child: Image.asset(
                    //                     "assets/python-logo-1.png",
                    //                     width: double.infinity,
                    //                     fit: BoxFit.fill,
                    //                   ),
                    //                 ),
                    //                 Positioned(
                    //                   right: 0,
                    //                   child: Container(
                    //                     decoration: BoxDecoration(
                    //                       borderRadius: BorderRadius.only(
                    //                           topLeft: Radius.circular(20),
                    //                           bottomLeft: Radius.circular(20),
                    //                           topRight: Radius.circular(10),
                    //                           bottomRight: Radius.circular(10)),
                    //                       color: Color.fromARGB(
                    //                           224, 255, 255, 255),
                    //                     ),
                    //                     child: Padding(
                    //                       padding:
                    //                           EdgeInsets.only(top: 30, left: 0),
                    //                       child: Column(
                    //                         children: [
                    //                           Text(
                    //                             "Python",
                    //                             style: GoogleFonts.montserrat(
                    //                                 fontWeight: FontWeight.bold,
                    //                                 fontSize: 26,
                    //                                 color: Colors.black),
                    //                             textAlign: TextAlign.center,
                    //                           ),
                    //                           Text(
                    //                             "Rs. 200",
                    //                             style: GoogleFonts.montserrat(
                    //                                 fontWeight: FontWeight.w500,
                    //                                 fontSize: 16,
                    //                                 color: Colors.black),
                    //                             textAlign: TextAlign.center,
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     width: 100,
                    //                     height: 100,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 15,
                    //         ),
                    //         GestureDetector(
                    //           onTap: () {
                    //             print(2);
                    //           },
                    //           child: Container(
                    //             width: 200,
                    //             decoration: BoxDecoration(
                    //                 color: Color.fromRGBO(129, 154, 167, 1),
                    //                 borderRadius: BorderRadius.circular(10)),
                    //             child: Stack(
                    //               children: [
                    //                 ClipRRect(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   child: Image.asset(
                    //                     "assets/about-nodejs.png",
                    //                     width: double.infinity,
                    //                     fit: BoxFit.cover,
                    //                   ),
                    //                 ),
                    //                 Positioned(
                    //                   right: 0,
                    //                   child: Container(
                    //                     decoration: BoxDecoration(
                    //                       borderRadius: BorderRadius.only(
                    //                           topLeft: Radius.circular(20),
                    //                           bottomLeft: Radius.circular(20),
                    //                           topRight: Radius.circular(10),
                    //                           bottomRight: Radius.circular(10)),
                    //                       color: Color.fromARGB(
                    //                           224, 255, 255, 255),
                    //                     ),
                    //                     child: Padding(
                    //                       padding:
                    //                           EdgeInsets.only(top: 30, left: 0),
                    //                       child: Column(
                    //                         children: [
                    //                           Text(
                    //                             "Node",
                    //                             style: GoogleFonts.montserrat(
                    //                                 fontWeight: FontWeight.bold,
                    //                                 fontSize: 26,
                    //                                 color: Colors.black),
                    //                             textAlign: TextAlign.center,
                    //                           ),
                    //                           Text(
                    //                             "Rs. 199",
                    //                             style: GoogleFonts.montserrat(
                    //                                 fontWeight: FontWeight.w500,
                    //                                 fontSize: 16,
                    //                                 color: Colors.black),
                    //                             textAlign: TextAlign.center,
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     width: 100,
                    //                     height: 100,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 15,
                    //         ),
                    //         GestureDetector(
                    //           onTap: () {
                    //             print(1);
                    //           },
                    //           child: Container(
                    //             width: 200,
                    //             decoration: BoxDecoration(
                    //                 color: Color.fromARGB(255, 26, 56, 72),
                    //                 borderRadius: BorderRadius.circular(10)),
                    //             child: Stack(
                    //               children: [
                    //                 ClipRRect(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   child: Image.asset(
                    //                     "assets/images/r4@.jpg",
                    //                     width: double.infinity,
                    //                     fit: BoxFit.cover,
                    //                   ),
                    //                 ),
                    //                 Positioned(
                    //                   right: 0,
                    //                   child: Container(
                    //                     decoration: BoxDecoration(
                    //                       borderRadius: BorderRadius.only(
                    //                           topLeft: Radius.circular(20),
                    //                           bottomLeft: Radius.circular(20),
                    //                           topRight: Radius.circular(10),
                    //                           bottomRight: Radius.circular(10)),
                    //                       color: Color.fromARGB(
                    //                           224, 255, 255, 255),
                    //                     ),
                    //                     child: Padding(
                    //                       padding:
                    //                           EdgeInsets.only(top: 30, left: 0),
                    //                       child: Column(
                    //                         children: [
                    //                           Text(
                    //                             "shopi",
                    //                             style: GoogleFonts.montserrat(
                    //                                 fontWeight: FontWeight.bold,
                    //                                 fontSize: 26,
                    //                                 color: Colors.black),
                    //                             textAlign: TextAlign.center,
                    //                           ),
                    //                           Text(
                    //                             "Rs. 1200",
                    //                             style: GoogleFonts.montserrat(
                    //                                 fontWeight: FontWeight.w500,
                    //                                 fontSize: 16,
                    //                                 color: Colors.black),
                    //                             textAlign: TextAlign.center,
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     width: 100,
                    //                     height: 100,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 0,
                    ),
                  ],
                ),
              ),
              SizedBox.expand(
                child: DraggableScrollableSheet(
                  snap: true,
                  initialChildSize: 0.40,
                  minChildSize: 0.40,
                  maxChildSize: 1,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                          borderRadius: BorderRadius.circular(20)),
                      child: ListView.builder(
                        controller: scrollController,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 3,
                              ),
                              Divider(
                                color: Colors.grey,
                                thickness: 3,
                                indent: 170,
                                endIndent: 170,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:100),
                                      child: Text(
                                        "Upcoming Events",
                                        style: GoogleFonts.lato(
                                            fontSize: 20,
                                            color:
                                                Color.fromARGB(255, 255, 255, 255)),
                                      ),
                                    ),
                                    SizedBox(width: 60),
                                    IconButton(onPressed: (){
                                      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  addevent()),
  );
                                    }, icon: Icon(Icons.add,color: Colors.white,)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: GestureDetector(
                                  // onTap: () {
                                  //   Navigator.of(context).push(
                                  //     MaterialPageRoute(
                                  //       builder: (context) => Screensearch(),
                                  //     ),
                                  //   );
                                  // },
                                  child: Container(
                                    width: 350,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Row(children: [
                                      SizedBox(
                                        width: 35,
                                      ),
                                      Text('Search an event',
                                          style: GoogleFonts.montserrat(
                                              color: Color.fromARGB(
                                                  255, 120, 120, 120),
                                              fontSize: 12)),
                                      SizedBox(
                                        width: 140,
                                      ),
                                      Icon(Icons.search),
                                      // onPressed: () {
                                      //   setState(() {
                                      //     String shopName = searchController.text;
                                      //   });
                                      //   searchshop(searchController.text);
                                      // },
                                      // color: Color.fromARGB(255, 120, 120, 120),
                                    ]),
                                  ),
                                  // TextField(
                                  //   controller: searchController,
                                  //   onChanged: (value) {
                                  //     searchController.text = value;
                                  //     setState(() {
                                  //       searchController.selection =
                                  //           TextSelection(
                                  //               baseOffset: value.length,
                                  //               extentOffset: value.length);
                                  //       // numberController.text = value;
                                  //     });
                                  //   },
                                  //   style: new TextStyle(
                                  //       color: Color.fromARGB(255, 0, 0, 0)),
                                  //   textAlign: TextAlign.center,
                                  //   decoration: InputDecoration(
                                  //       // contentPadding: EdgeInsets.symmetric(
                                  //       //     vertical: 10, horizontal: 10),
                                  //       focusedBorder: new OutlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             //color: Color.fromARGB(
                                  //             //  255, 255, 255, 255)
                                  //             ),
                                  //         borderRadius: const BorderRadius.all(
                                  //           const Radius.circular(30),
                                  //         ),
                                  //       ),
                                  //       enabledBorder: new OutlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             //color: Color.fromARGB(
                                  //             //  255, 255, 255, 255)
                                  //             ),
                                  //         borderRadius: const BorderRadius.all(
                                  //           const Radius.circular(30),
                                  //         ),
                                  //       ),
                                  //       filled: true,
                                  //       fillColor:
                                  //           Color.fromARGB(255, 241, 241, 241),
                                  //       // prefixIcon: IconButton(
                                  //       //   icon: Icon(Icons.clear),
                                  //       //   onPressed: () {
                                  //       //     setState(() {
                                  //       //       searchController.clear();
                                  //       //     });
                                  //       //   },
                                  //       //   color:
                                  //       //       Color.fromARGB(255, 120, 120, 120),
                                  //       // ),
                                  //       suffixIcon: IconButton(
                                  //         icon: Icon(Icons.search),
                                  //         onPressed: () {
                                  //           setState(() {
                                  //             String shopName =
                                  //                 searchController.text;
                                  //           });
                                  //           searchshop(searchController.text);
                                  //         },
                                  //         color: Color.fromARGB(
                                  //             255, 120, 120, 120),
                                  //       ),
                                  //       hintText:
                                  //           'Select a store to start shopping',
                                  //       hintStyle: GoogleFonts.montserrat(
                                  //           color: Color.fromARGB(
                                  //               255, 120, 120, 120),
                                  //           fontSize: 12)),
                                  // ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 700,
                                width: double.infinity,

                                 child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('events')
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
                                            height: 75,
                                            child: ListTile(
                                              title: Text(
                                                snapshot.data!.docs[index]
                                                    ['Event Name'],
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                              subtitle: Text(
                                                snapshot.data!.docs[index]
                                                    ['Date'],
                                                style: GoogleFonts.poppins(
                                                    color: Color.fromARGB(
                                                        255, 170, 170, 170),
                                                    fontSize: 13),
                                              ),
                                              leading: CircleAvatar(
                                                radius: 25,
                                                backgroundImage: AssetImage(
                                                    'assets/Event-PNG-Image.png'),
                                              ),
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
                                // child: FutureBuilder(
                                //   builder: (context,),
                                //   future: users,
                                // shopdetails();
                                //   child: FutureBuilder(
                                //     future: futureData,
                                //     builder: (BuildContext context,
                                //         AsyncSnapshot snapshot) {
                                //       if (snapshot.hasData) {
                                //         return ListView.separated(
                                //           itemCount: snapshot.data.length,
                                //           //controller: scrollController,
                                //           physics: RangeMaintainingScrollPhysics(),
                                //           scrollDirection: Axis.vertical,
                                //           itemBuilder: (ctx, index) {
                                //             return Container(
                                //               height: 75,
                                //               child: ListTile(
                                //                 title: Text(
                                //                   snapshot.data[index].name,
                                //                   style: GoogleFonts.poppins(
                                //                       color: Colors.white,
                                //                       fontSize: 18),
                                //                 ),
                                //                 subtitle: Text(
                                //                   snapshot.data[index].location,
                                //                   style: GoogleFonts.poppins(
                                //                       color: Color.fromARGB(
                                //                           255, 170, 170, 170),
                                //                       fontSize: 13),
                                //                 ),
                                //                 leading: CircleAvatar(
                                //                   radius: 25,
                                //                   backgroundImage: AssetImage(
                                //                       'assets/images/icons8-adidas-50.png'),
                                //                 ),
                                //                 // trailing: Icon(
                                //                 //   Icons.favorite_rounded,
                                //                 //   color: Colors.red,
                                //                 // ),
                                //               ),
                                //             );
                                //           },
                                //           separatorBuilder: (ctx, index) {
                                //             return Divider(
                                //               color:
                                //                   Color.fromARGB(42, 255, 255, 255),
                                //             );
                                //           },
                                //         );
                                //       } else if (snapshot.hasError) {
                                //         return const CircularProgressIndicator();
                                //       }
                                //       ;
                                //       throw {};
                                //     },
                                //   ),
                                // ),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildImage(context, String im, int index) {
  return GestureDetector(
    onTap: () {
      if (index == 0) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Astra(),
        ));
      }
      if (index == 1) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Spectra(),
        ));
      }
      if (index == 2) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Insendium(),
        ));
      }
    },
    
    
  
    child: Container(
      width: 320,
      height: 100,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(im, fit: BoxFit.cover)),
    ),
  );
}


Widget buildIndicator(int activeIndex) {
  return AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: 3,
    effect: ScrollingDotsEffect(
        radius: 5,
        dotWidth: 5,
        dotHeight: 5,
        dotColor: Color.fromARGB(255, 138, 137, 137),
        activeDotColor: Color.fromARGB(255, 255, 255, 255)),
  );
}

// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Container(
//         width: double.infinity,
//         height: 40,
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(5)),
//         child: Center(
//           child: TextField(
//             decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.clear),
//                   onPressed: () {

//                   },
//                 ),
//                 hintText: 'Search...',
//                 border: InputBorder.none),
//           ),
//         ),
//       )),
//     );
//   }
// }
