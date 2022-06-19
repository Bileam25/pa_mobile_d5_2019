import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pa_mobile_d5_2019/keranjangpage.dart';

class ShoeDetail extends StatefulWidget {
  final String image;
  final String barang;
  final int harga;
  final String deskripsi;
  final String jenis;
  final List sizes;

  const ShoeDetail(this.image, this.barang, this.harga, this.deskripsi,
      this.jenis, this.sizes);

  @override
  State<ShoeDetail> createState() => _ShoeDetailState();
}

class _ShoeDetailState extends State<ShoeDetail> {
  int activeSize = 0;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? user = auth.currentUser!.email;
    CollectionReference keranjang = firestore.collection("Keranjang");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.image,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      // NOTE: title
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.barang,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 28,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                Text(
                                  "Rp ${widget.harga}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      //============================================
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Size",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      //==========================
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  List.generate(widget.sizes.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      activeSize = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: activeSize == index
                                              ? Colors.black
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 0.5,
                                                blurRadius: 1,
                                                color: Colors.black
                                                    .withOpacity(0.1))
                                          ]),
                                      child: Center(
                                        child: Text(
                                          widget.sizes[index],
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: activeSize == index
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          )),
                      //===================================================
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.deskripsi,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          // Container(
                          //   margin: EdgeInsets.symmetric(
                          //     horizontal: 24,
                          //   ),
                          //   height: 50,
                          //   width: 50,
                          //   child: RaisedButton(
                          //       onPressed: () {
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) =>
                          //                 (), //nanti alihkan ke halaman favorite
                          //           ),
                          //         );
                          //       },
                          //       color: Colors.white,
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(17),
                          //       ),
                          //       child: Icon(Icons.favorite_outline)),
                          // ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width - (48),
                            child: RaisedButton(
                              onPressed: () {
                                final mySnackBar = SnackBar(
                                  content: Text(
                                    "Berhasil Dimasukan di Keranjang",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  duration: Duration(seconds: 3),
                                  padding: EdgeInsets.all(10),
                                  backgroundColor: Colors.green,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(mySnackBar);
                                keranjang.add({
                                  'Image': widget.image,
                                  'Barang': widget.barang,
                                  'Jumlah': 1,
                                  'Harga': widget.harga,
                                  'Deskripsi': widget.deskripsi,
                                  'Jenis': widget.jenis,
                                  'User': user,
                                });
                              },
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: Text('Masukkan Keranjang',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 28)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/kiri.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
