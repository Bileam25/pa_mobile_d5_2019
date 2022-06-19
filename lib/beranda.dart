// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:pa_mobile_d5_2019/HomePage.dart';
import 'package:pa_mobile_d5_2019/Item_Card.dart';
import 'package:pa_mobile_d5_2019/keranjangpage.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  static final List<Widget> tabBar = [
    Tab(text: "PRIA"),
    Tab(text: "PREMPUAN"),
    Tab(text: "All"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBar.length,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onTap: () {},
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search, color: Colors.blue),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: new BorderSide(color: Colors.white),
                ),
                fillColor: Color(0xfff3f3f4),
                filled: true),
          ),
          backgroundColor: Colors.grey,
          bottom: TabBar(tabs: tabBar),
        ),
        backgroundColor: Colors.white10,
        body: TabBarView(
          children: [
            LauncherPage(),
            LauncherPage2(),
            LauncherPage3(),
          ],
        ),
      ),
    );
  }
}
