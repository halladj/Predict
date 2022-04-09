import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/components/components.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class Predition extends StatelessWidget {
  const Predition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(appBar: AppBar(), titleText: "Predicetion Page",),
        body: const Padding(
            padding: EdgeInsets.all(18.0), child: PredictionCard()
            /* Container(
            color: Colors.purple,
            child:Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                          height: 100,
                          width: 250,
                          child: Card(
                              child:  Center(
                                  child:Text(
                                  "Predition Page",
                                  style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: 
                                      FontWeight.bold
                                    ),
                              )

                              )                         ),
                      ),
                      ElevatedButton(
                          onPressed: (){
                            Navigator.popAndPushNamed(context, '/generatedQR');
                          },
                          child: const Text("Generate QR code"),
                      )
                    ],
                ),
            )
            ),*/
            ));
  }
}

