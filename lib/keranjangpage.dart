import 'package:flutter/material.dart';
import 'package:pa_mobile_d5_2019/Item_Card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pa_mobile_d5_2019/auth_services.dart';

import 'Keranjang.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({Key? key}) : super(key: key);

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String userEmail = auth.currentUser!.email.toString();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference keranjang = firestore.collection("Keranjang");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Keranjang',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Expanded(
            //// VIEW DATA HERE
            child: StreamBuilder<QuerySnapshot>(
              stream: keranjang.where('User', isEqualTo: userEmail).snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                if (snapshot.hasData) {
                  return Column(
                      children: snapshot.data!.docs
                          .map(
                            (e) => ItemKeranjang(
                              e['Image'],
                              e['Barang'],
                              e['Harga'],
                              e['Jumlah'],
                              e['Deskripsi'],
                              e['Jenis'],
                              onUpdate: () {
                                keranjang.doc(e.id).update(
                                  {
                                    'Jumlah': e.get('Jumlah') + 1,
                                  },
                                );
                              },
                              onUpdate2: () {
                                if (e.get('Jumlah') <= 1) {
                                } else {
                                  keranjang.doc(e.id).update(
                                    {
                                      'Jumlah': e.get('Jumlah') - 1,
                                    },
                                  );
                                }
                              },
                              onDelete: () {
                                keranjang.doc(e.id).delete();
                              },
                            ),
                          )
                          .toList());
                } else {
                  return Text("Barang Tidak Ada");
                }
              },
            ),
          ),
        ]),
      ]),
    );
  }
}
