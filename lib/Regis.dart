// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pa_mobile_d5_2019/akunpage.dart';
import 'package:pa_mobile_d5_2019/auth_services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisScreen extends StatefulWidget {
  @override
  _RegisScreenState createState() => _RegisScreenState();
}

class _RegisScreenState extends State<RegisScreen> {
  bool showSpinner = false;
  bool isPassHidden = true;
  String error = '';
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController umurController = TextEditingController();
  TextEditingController noController = TextEditingController();
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("daftarUser");
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Registrasi Ulang\n",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontSize: 35.0, color: Colors.black),
                  ),
                  TextSpan(text: "\n"),
                  TextSpan(
                    text:
                        "Silahkan isi data di bawah ini untuk Registrasi ulang",
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40, left: 40, top: 25),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.people,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Masukan Nama Anda",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      controller: namaController,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40, left: 40, top: 25),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.add_location_alt_sharp,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Masukan Alamat Anda",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      controller: alamatController,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40, left: 40, top: 25),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.cake_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Masukan Umur Anda",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      controller: umurController,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40, left: 40, top: 25),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.add_ic_call_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Masukan No.HP Anda",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      controller: noController,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 15,
              ),
              child: ElevatedButton(
                onPressed: () {
                  users.add({
                    'email': auth.currentUser!.email.toString(),
                    'nama': namaController.text,
                    'umur': int.tryParse(umurController.text) ?? 0,
                    'alamat': alamatController.text,
                    'nohp': int.tryParse(noController.text) ?? 0,
                  });
                  namaController.text = '';
                  umurController.text = '';
                  alamatController.text = '';
                  noController.text = '';
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AkunPage()));
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 60.0, vertical: 13.0),
                  child: Text(
                    "Daftar",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontSize: 17.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
