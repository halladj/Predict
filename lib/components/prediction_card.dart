import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/helpers/api/predictions.dart';
import 'package:proto/home/home_cubit.dart';
import "package:proto/prediction_form/model/pc.model.dart";
import 'package:proto/screens/generated_qr_code.dart';

class PredictionCard extends StatelessWidget {
  const PredictionCard({Key? key, required this.price, required this.pc})
      : super(key: key);
  final double price;

  //final Function onPressReset;

  final PcInfo pc;

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.watch<HomeCubit>();
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//             child: Column(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Colors.blue.withOpacity(0.08),
//                             Colors.blue.withOpacity(0.025),
//                           ],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         border: Border.all(
//                           color: Colors.white.withOpacity(0.3),
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       constraints: const BoxConstraints(minHeight: 160),
//                       child: Padding(
//                         padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 20.0),
//                               child: Column(
//                                 children: [
//                                   const Text(
//                                     "Laptop's Price: ",
//                                     style: TextStyle(
//                                       fontSize: 26,
//                                       fontWeight: FontWeight.w500,
//                                       color: Color(0xff06446C),
//                                     ),
//                                     textAlign: TextAlign.start,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20.0),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.baseline,
//                                       textBaseline: TextBaseline.alphabetic,
//                                       children: [
//                                         Text(
//                                           // ignore: unnecessary_string_interpolations
//                                           "${price.toStringAsFixed(2)}",
//                                           style: const TextStyle(
//                                             fontSize: 34,
//                                             fontWeight: FontWeight.w500,
//                                             color: Color(0xff06446C),
//                                           ),
//                                         ),
//                                         const Text(
//                                           " DZD",
//                                           style: TextStyle(
//                                             fontSize: 26,
//                                             fontWeight: FontWeight.w500,
//                                             color: Color(0xff06446C),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),

    return homeCubit.qrCondition
        ? const Center(child: CircularProgressIndicator())
        : Container(
            margin: const EdgeInsets.only(top: 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],

                          border: Border.all(
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(15),
                          //color: Color(0xffabaffa),
                          color: Theme.of(context).backgroundColor,
                        ),
                        constraints: const BoxConstraints(minHeight: 160),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 5, 40, 25),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 20.0, left: 25.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Laptop's Price is : ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                          // textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          price.toStringAsFixed(2),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        Text(
                                          " DZD",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(

//                                 height: 220,
//                                 width: 350,
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0, vertical: 20.0),
//                                 child: const Image(
//                                     image: AssetImage("assets/laptop3.png"))),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 60),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       height: 50,
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         // gradient: LinearGradient(colors: [
//                         //   HexColor("#4589D7"),
//                         //   HexColor("#D0A0F7")
//                         // ]),
//                         color: Color(0xff00CBBF),

                                  height: 340,
                                  width: 500,
                                  //padding: EdgeInsets.symmetric(horizontal: 10.0,),
                                  child: const Image(
                                      image: AssetImage(
                                          "assets/laptop_pricee.png"))),
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
                                      Theme.of(context).primaryColorDark,
                                      Theme.of(context).primaryColorLight,
                                    ]),
                                // color: Color(0xff00CBBF),
                              ),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.transparent),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ))),
                                  onPressed: () async {
                                    homeCubit.changeQrCodeCondition(
                                        value: true);
                                    true;
                                    final data =
                                        await QrCodeApi.generateQr(pc, price);
                                    homeCubit.changeQrCodeCondition(
                                        value: false);
                                    Navigator.pushNamed(context, "/generatedQR",
                                        arguments: Arguments(
                                            hash: data["hash"].toString(),
                                            price: price,
                                            laptop: pc));
                                    //Navigator.pushNamed(context, "/generatedQR");
                                  },
                                  child: const Text(
                                    "Generate QR",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  )),
                            ),
                            Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),

                                //color: Theme.of(context).backgroundColor,
                              ),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: const BorderSide(
                                          color: Color(0xff00CBBF),
                                        ),
                                      ))),
                                  onPressed: () {
                                    //Navigator.of(context).pushNamed("/");
                                    homeCubit.changePredictionFormCondition(
                                        value: false);
                                  },
                                  child: const Text(
                                    "Back to main page",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff00CBBF),
                                    ),
                                  )),
                            ),
                          ]),

//                     //SizedBox(width: 1.0,),
//                     Container(
//                       height: 50,
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         // gradient: LinearGradient(colors: [
//                         //   Color(0xff4589D7),
//                         //   Color(0xffD0A0F7)
//                         // ]),
//                         //color: Color(0xff874FC4),
//                         color: Colors.white,

                      //SizedBox(width: 1.0,),
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
                )
              ],
            ),
          );
  }
}
