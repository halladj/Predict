import 'dart:ui';

import 'package:dio/dio.dart';

import "package:flutter/material.dart";
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:proto/components/components.dart';
import 'package:proto/constants.dart';
import 'package:proto/home.dart';
import 'package:proto/home/home_cubit.dart';
import "package:proto/prediction_form/model/pc.model.dart";

import 'package:proto/prediction_form/prediction_form.dart';
import 'package:proto/screens/prediction.dart';

import 'package:proto/screens/generated_qr_code.dart';


class PredictionCard extends StatelessWidget {
  const PredictionCard({Key? key, required this.price, required this.pc})
      : super(key: key);
  final double price;

  //final Function onPressReset;

  final PcInfo pc;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

//             AppBar(
//               leading: IconButton(
//                   icon: const Icon(Icons.arrow_back, size: 30),
//                   onPressed: () {
//                     Navigator.pushReplacementNamed(context, "/");
//                   }),
//               title:
//                   const Text("The Prediction", style: TextStyle(fontSize: 24)),
//               actions: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
//                   child: Tab(
//                     icon: Image.asset(
//                       "assets/logo3.png",
//                       width: 90,
//                       height: 90,
//                     ),
//                   ),
//                 ),
//               ],
//             ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
                      child: Container(
                        decoration: BoxDecoration(

                          gradient: LinearGradient(colors: [
                            Colors.blue.withOpacity(0.08),
                            Colors.blue.withOpacity(0.025),
                          ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                          borderRadius: BorderRadius.circular(10),

                        ),
                          constraints: const BoxConstraints(minHeight: 160),

                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  child: Column(
                                    children: [
                                      Text("Laptop's Price: ",
                                          style: const TextStyle(fontSize: 26,
                                          fontWeight: FontWeight.w500,
                                            color: Color(0xff06446C),
                                          ),
                                        textAlign: TextAlign.start,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text("${price.toStringAsFixed(2)}",style: const TextStyle(fontSize: 34,
                                              fontWeight: FontWeight.w500,color: Color(0xff06446C),),),
                                            Text(" DZD",style: const TextStyle(fontSize: 26,
                                              fontWeight: FontWeight.w500,color: Color(0xff06446C),),
                                            ),],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 220,
                                    width: 350,
                                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                                    child: const Image(image: AssetImage("assets/laptop3.png"))),
                              ],
                            ),
                          ),


                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            // gradient: LinearGradient(colors: [
                            //   HexColor("#4589D7"),
                            //   HexColor("#D0A0F7")
                            // ]),
                            color: Color(0xff00CBBF),
                        ),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ))),
                            onPressed: () {
                              Navigator.pushNamed(context, "/generatedQR");
                            },
                            child: const Text(
                              "Generate QR",
                              style: TextStyle(fontSize: 18),
                            )),
                      ),

                      //SizedBox(width: 1.0,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                            // gradient: LinearGradient(colors: [
                            //   Color(0xff4589D7),
                            //   Color(0xffD0A0F7)
                            // ]),
                          //color: Color(0xff874FC4),
                          color: Colors.white,
    ),

                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(
                                    color: Color(0xff00CBBF),
                                  ),
                                ))),
                            onPressed: ()  {

                              Navigator.of(context).pushNamed("/");
                            },
                            child: const Text(
                              "Back to main page",
                              style: TextStyle(fontSize: 18,
                              color: Color(0xff00CBBF),),
                            )),
                      ),

                    ],

//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
//                         child: Text(
//                             "Laptop's Price: \n${price.round().toString()} DZD",
//                             style: const TextStyle(fontSize: 40)),
//                       )),
//                   const Image(image: AssetImage("assets/laptop2.png")),
//                   const SizedBox(height: 20),
//                   Container(
//                     width: 228,
//                     height: 70,
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(80)),
//                         gradient: LinearGradient(colors: [
//                           HexColor("#4589D7"),
//                           HexColor("#D0A0F7")
//                         ])),
//                     child: ElevatedButton(
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                                 Colors.transparent),
//                             shape: MaterialStateProperty.all<
//                                 RoundedRectangleBorder>(RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(80.0),
//                             ))),
//                         onPressed: () async {
//                           //TODO CALL THE GENEARET QR HERE
//                           final response = await generateQr(pc, price);
//                           Navigator.pushNamed(context, "/generatedQR",
//                               arguments:
//                                   Arguments(hash: response, price: price));
//                         },
//                         child: const Text(
//                           "Generate QR code",
//                           style: TextStyle(fontSize: 24),
//                         )),

                  ),
                ],
              ),
            )
          ]),
    );
  }
}

generateQr(PcInfo data, double price) async {
  try {
    var response = await Dio().post('http://192.168.1.18:80/api/qr/generate',
        data: {"laptop": data.toJson(), "price": price},
        options: Options(
          contentType: Headers.jsonContentType,
          validateStatus: (status) => true,
        ));
    print(response.toString());
    return response.toString();
  } catch (e) {
    print(e);
  }
}
