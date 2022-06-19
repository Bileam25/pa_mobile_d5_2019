import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pa_mobile_d5_2019/akun_card.dart';

class DataAkunPage extends StatelessWidget {
  const DataAkunPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference user = firestore.collection("daftarUser");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
          body: 

      Container(
        child: 
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
                                    (e) =>
                                    AkunCard(
                                      e['nama'],
                                      e['alamat'],
                                      e['umur'],
                                      e['nohp'],
                                      )
                                  )
                                  .toList());
                    } else {
                      // return _profileName("No Name");
                      return Text("no data");
                    }
                  }), //
      ),
    );
  }
}
