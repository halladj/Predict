import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/components/components.dart';
import 'package:proto/helpers/api/predictions.dart';
import 'package:proto/home/home_cubit.dart';
import 'package:proto/prediction_form/model/pc.model.dart';
import "package:proto/prediction_form/prediction_form.dart";

import 'generated_qr_code.dart';

class Prediction extends StatelessWidget {
  Prediction({Key? key, required this.pc, required this.price})
      : super(key: key);

  PcInfo pc;
  double price;

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();
    return Scaffold(
        appBar: CustomAppBar(
            appBar: AppBar(),
            titleText: "Predicetion Page",
            icon: true,
            homeCubit: homeCubit),
        body: homeCubit.qrCondition
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                margin: const EdgeInsets.only(top: 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20.0),
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
                              child: Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, bottom: 0.0, left: 0),
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
                                            textBaseline:
                                                TextBaseline.alphabetic,
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
                                    //here

                                    Column(children: [
                                      ListTile( title: Text(pc.brand), leading: Text("brand")),
                                      ListTile( title: Text("${pc.cpu.brand} ${pc.cpu.modifier} ${pc.cpu.numberIdentifier} ${pc.cpu.family}"), leading: Text("cpu")),
                                      ListTile( title: Text("${pc.gpu.brand} ${pc.gpu.numberIdentifier} ${pc.gpu.vram} gb" ), leading: Text("gpu")),
                                      ListTile( title: Text("${pc.ram}gb ${pc.ramType} ${pc.ramFrequency.toInt()}ghz"), leading: Text("ram")),
                                      ListTile( title: Text("${pc.screenSize} ${pc.screenResolution} ${pc.screenRefreshRate}hz"), leading: Text("screen")),
                                      ListTile( title: Text("ssd: ${pc.ssd}gb\nhdd: ${pc.hdd}gb"), leading: Text("storage")),
                                      ListTile( title: Text(pc.state == 1 ? "new" : "used"), leading: Text("state")),
                                      ListTile( title: Text(pc.touchScreen== 1 ? "has touch screen" : "does not have touch screen"), leading: Text("touch screen")),
                                    ],)
                                    
                                  ],
                                ),
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
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Theme.of(context).primaryColorDark,
                                          Theme.of(context).primaryColorLight,
                                        ]),
                                  ),
                                  child: TextButton(
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
                                        final data = await QrCodeApi.generateQr(
                                            pc, price);
                                        homeCubit.changeQrCodeCondition(
                                            value: false);
                                        Navigator.pushNamed(
                                            context, "/generatedQR",
                                            arguments: Arguments(
                                                hash: data["hash"].toString(),
                                                price: price,
                                                laptop: pc));
                                        //Navigator.pushNamed(context, "/generatedQR");
                                      },
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: Text(
                                          "Generate QR",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      )),
                                ),
                                Container(
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),

                                    //color: Theme.of(context).backgroundColor,
                                  ),
                                  child: TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Theme.of(context)
                                                      .backgroundColor),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            side: const BorderSide(
                                              color: Color(0xff00CBBF),
                                            ),
                                          ))),
                                      onPressed: () {
                                        //Navigator.of(context).pushNamed("/");
                                        homeCubit.changePredictionFormCondition(
                                            value: false);
                                      },
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        child: Text(
                                          "Back to main page",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff00CBBF),
                                          ),
                                        ),
                                      )),
                                ),
                              ]),
                        ],
                      ),
                    )
                  ],
                ),
              ));
  }
}
