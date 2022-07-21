import 'package:campco2/screens/AdminLogin.dart';
import 'package:campco2/screens/home.dart';
import 'package:campco2/screens/profile.dart';
import 'package:campco2/screens/reg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'adminhome.dart';
//import 'package:campco2/signup.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 24, 24, 24),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 300,
            child: DrawerHeader(
              child: Text(
                '',
                style:
                    GoogleFonts.montserrat(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 33, 33, 35),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/clipart-profile-15.jpg',
                      ))),
            ),
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(
                Icons.verified_user,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 17,
                  //fontWeight: FontWeight.w600
                ),
              ),
               onTap: (){
                                        Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const HomePage1()));
                                      },
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 17,
                //fontWeight: FontWeight.w600
              ),
            ),
            onTap: () => {
              //signout(context),
            },
          ),
          ListTile(
            leading: Icon(
                Icons.admin_panel_settings,
                color: Colors.white,
              ),
              title: Text(
                'Admin',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 17,
                  //fontWeight: FontWeight.w600
                ),
              ),
               onTap: (){
                                        Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const AdminLogin()));
                                      },

          ),
          ListTile(
            leading: Icon(
                Icons.admin_panel_settings,
                color: Colors.white,
              ),
              title: Text(
                'Volunteer',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 17,
                  //fontWeight: FontWeight.w600
                ),
              ),
              //  onTap: (){
              //                           Navigator.push(context,
              //                 MaterialPageRoute(builder: (context) => const AdminLogin()));
              //                         },

          )
        ],
      ),
    );
  }
}

// signout(BuildContext context) async {
//   final _sp = await SharedPreferences.getInstance();
//   await _sp.clear();
//   Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (context) => ScreenSignup()),
//       (route) => false);
// }
