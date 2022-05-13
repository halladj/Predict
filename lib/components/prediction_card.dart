import "package:flutter/material.dart";
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:proto/components/components.dart';
import "package:proto/prediction_form/model/pc.model.dart";

class PredictionCard extends StatelessWidget {
  const PredictionCard({Key? key, required this.price}) : super(key: key);
  final double price;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 30),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/");
                  }),
              title:
                  const Text("Predictionpage", style: TextStyle(fontSize: 24)),
              actions: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Tab(
                    icon: Image.asset(
                      "assets/logo3.png",
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
              child: Column(
                children: [
                  Container(
                      constraints: const BoxConstraints(minHeight: 160),
                      margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: HexColor("#ebf3fb"),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        child: Text("Laptop's Price: \n${price.toString()} DZD",
                            style: const TextStyle(fontSize: 40)),
                      )),
                  const Image(image: AssetImage("assets/laptop2.png")),
                  const SizedBox(height: 20),
                  Container(
                    width: 228,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80)),
                        gradient: LinearGradient(colors: [
                          HexColor("#4589D7"),
                          HexColor("#D0A0F7")
                        ])),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0),
                            ))),
                        onPressed: () {
                          Navigator.pushNamed(context, "/generatedQR");
                        },
                        child: const Text(
                          "Generate QR code",
                          style: TextStyle(fontSize: 24),
                        )),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
