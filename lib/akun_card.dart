import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AkunCard extends StatelessWidget {
  // const AkunCard({Key? key}) : super(key: key);

  String nama;
  String alamat;
  int umur;
  int noHP;

  AkunCard(this.nama, this.alamat, this.umur, this.noHP);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                children: [
                  Text(
                    "Data Akun",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  // Image(
                                  image: AssetImage("assets/logo.png"))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama", style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,),
                Text(nama, style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,),
                SizedBox(height: 10,),
                Text("Alamat", style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,),
                Text(alamat, style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,),
                SizedBox(height: 10,),
                Text("Umur", style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,),
                Text('$umur', style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,),
                SizedBox(height: 10,),
                Text("No HP", style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,),
                Text('$noHP', style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,),
                SizedBox(height: 10,),
              ],
            ),
          )
        ],
      ),
      // padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      // child: GestureDetector(
      //   onTap: () {
      //     FocusScope.of(context).unfocus();
      //   },
      //   child: Column(
      //     children: [
      //       Text(
      //         "Data Akun",
      //         style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      //       ),
      //       SizedBox(
      //         height: 15,
      //       ),
      //       Center(
      //         child: Column(
      //           children: [
      //             Container(
      //               width: 130,
      //               height: 130,
      //               decoration: BoxDecoration(
      //                   border: Border.all(
      //                       width: 4,
      //                       color: Theme.of(context).scaffoldBackgroundColor),
      //                   boxShadow: [
      //                     BoxShadow(
      //                         spreadRadius: 2,
      //                         blurRadius: 10,
      //                         color: Colors.black.withOpacity(0.1),
      //                         offset: Offset(0, 10))
      //                   ],
      //                   shape: BoxShape.circle,
      //                   image: DecorationImage(
      //                       fit: BoxFit.cover,
      //                       // Image(
      //                       image: AssetImage("assets/logo.png"))),
      //             ),
      //             Positioned(
      //                 bottom: 0,
      //                 right: 0,
      //                 child: Container(
      //                   height: 40,
      //                   width: 40,
      //                   decoration: BoxDecoration(
      //                     shape: BoxShape.circle,
      //                     border: Border.all(
      //                       width: 4,
      //                       color: Theme.of(context).scaffoldBackgroundColor,
      //                     ),
      //                     color: Colors.green,
      //                   ),
      //                   child: Icon(
      //                     Icons.edit,
      //                     color: Colors.white,
      //                   ),
      //                 )),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: 35,
      //       ),
      //     ],
      //   ),
      // ),
      
    );
  }
}
