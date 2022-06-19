// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pa_mobile_d5_2019/beranda.dart';
import 'package:pa_mobile_d5_2019/keranjangpage.dart';
import 'package:pa_mobile_d5_2019/transaksipage.dart';
import 'package:pa_mobile_d5_2019/akunpage.dart';

class HalamanPage extends StatefulWidget {
  @override
  State<HalamanPage> createState() => _HalamanPageState();
}

class _HalamanPageState extends State<HalamanPage> {
  int _bottomNavCurrenntIndex = 0;
  List<Widget> _container = [
    Beranda(),
    KeranjangPage(),
    TransaksiPage(),
    AkunPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrenntIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrenntIndex = index;
          });
        },
        currentIndex: _bottomNavCurrenntIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Keranjang",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment_outlined),
            label: "Transaksi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
