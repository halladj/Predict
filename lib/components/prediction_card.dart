import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

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
      margin: EdgeInsets.only(top:2.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),],

                      border: Border.all(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(15),
                      //color: Color(0xffabaffa),
                      color: Colors.white,

                    ),
                      constraints: const BoxConstraints(minHeight: 160),

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 40, 25),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0,bottom:20.0,left: 25.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Laptop's Price: ",
                                          style: const TextStyle(fontSize: 28,
                                          fontWeight: FontWeight.w400,
                                            color: Colors.blueGrey,
                                          ),
                                        //textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text("${price.toStringAsFixed(2)}",style: const TextStyle(fontSize: 38,
                                        fontWeight: FontWeight.w500,color: Color(0xff06446C),),),
                                      Text(" DZD",style: const TextStyle(fontSize: 28,
                                        fontWeight: FontWeight.w500,color: Color(0xff06446C),),
                                      ),],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 340,
                                width: 500,
                                //padding: EdgeInsets.symmetric(horizontal: 10.0,),
                                child: const Image(image: AssetImage("assets/laptop_pricee.png"))),
                          ],
                        ),
                      ),


                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,

                              colors: [

                                HexColor("#d8a1f9"),
                                HexColor("#57ebdf"),
                              ]),
                           // color: Color(0xff00CBBF),
                        ),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
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
                            const BorderRadius.all(Radius.circular(15)),
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
                                  borderRadius: BorderRadius.circular(15.0),
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
