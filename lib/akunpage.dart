// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pa_mobile_d5_2019/About.dart';
import 'package:pa_mobile_d5_2019/Regis.dart';
import 'package:pa_mobile_d5_2019/Sign_In_Page.dart';
import 'package:pa_mobile_d5_2019/akun_card.dart';
import 'package:pa_mobile_d5_2019/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pa_mobile_d5_2019/data_akun_page.dart';

class AkunPage extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String userEmail = auth.currentUser!.email.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference user = firestore.collection("daftarUser");
    // String userEmail = auth.currentUser!.email.toString();
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.grey,
        title: Text("Profil"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
      ),
      body: 
      
      SafeArea(
          child: Column(
        children: [
          //for circle avtar image
          _getHeader(),
          SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: user
                  // .where('email', isEqualTo: auth.currentUser!.email.toString())
                  .where('email', isEqualTo: auth.currentUser!.email.toString())
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasData) {
                  return
                      // _profileName("Modric__");
                      Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => _profileName(
                                  e['nama'],
                                ),
                              )
                              .toList());
                } else {
                  // return _profileName("No Name");
                  return Text(" No data ");
                }
              }), //
          // _profileName(""),
          SizedBox(
            height: 14,
          ),
          _settingsCard(),
        ],
      )),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage("assets/logo.png"))
                // color: Colors.orange[100],
                ),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _settingsCard() {
    FirebaseAuth auth = FirebaseAuth.instance;
    String userEmail = auth.currentUser!.email.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference user = firestore.collection("daftarUser");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Akun"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataAkunPage(),
                    ));
              },
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.dashboard_customize),
              title: Text("About Us"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoTokoMusik()));
              },
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.topic),
              title: Text("Change Theme"),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text("Registrasi ulang"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisScreen()));
              },
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text("Logout Akun"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
