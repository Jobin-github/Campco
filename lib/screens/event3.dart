import 'package:campco2/screens/reg.dart';
import 'package:campco2/screens/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Insendium extends StatefulWidget {
  const Insendium({Key? key}) : super(key: key);

  @override
  _InsendiumState createState() => _InsendiumState();
}

class _InsendiumState extends State<Insendium> {
  List<String> availableStorages = ['1', '2', '3', '4'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
        title: const Text(
          "SJCET",
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
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/photo_2022-07-09_01-33-41.jpg'),
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
                children: const [
                  Text(
                    "Insendium 2022",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  
                ],
              ),
            ),
      
            Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 20,bottom: 10),
                              child: Text(
                                'Select Number of Participants',
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
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: availableStorages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => setState(() {
                      _selectedIndex = index;
                    }),
                    child: storageWidget(
                        _selectedIndex == index, availableStorages[index]),
                  );
                },
              ),
            ),
             Container(
                                    height: 165,
                                    width: double.infinity,
        
                                    child: StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('insendium')
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
                                                  title: Text(
                                                    snapshot.data!.docs[index]
                                                        ['Price_insendium'],
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                  subtitle: Text(
                                                    snapshot.data!.docs[index]
                                                        ['Description_insendium'],
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
              onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => signup1(), // The page you want
            ),
          );
        },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  "Continue",
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
