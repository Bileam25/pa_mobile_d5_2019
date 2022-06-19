import 'package:flutter/material.dart';
import 'package:pa_mobile_d5_2019/halamanpage.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/landingpage.png",
                  height: 1840, width: 2860, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5,
                left: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Shoe STORE",
                    style: (TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Selamat Datang di Shoe STORE \nTempat terbaik mencari Sepatu!",
                    style: (TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 40,
                    width: 200,
                    child: RaisedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HalamanPage(),
                        //   ),
                        // );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HalamanPage()));
                      },
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Text(
                        "Beli Sekarang",
                        style: (TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                      ),
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
