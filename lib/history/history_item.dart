import "package:flutter/material.dart";
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:proto/history/history.dart';
import 'package:proto/history/history_model.dart';

class HistoryItem extends StatelessWidget {
  HistoryItem({Key? key, required this.history}) : super(key: key);

  History history;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          height: 70,
          color: HexColor("#ebf3fb"),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:
                  Text(history.pc.brand, style: const TextStyle(fontSize: 26)),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Brand: ${history.pc.brand}",
                            ),
                            Text(
                              "Cpu Brand: ${history.pc.cpu.brand}",
                            ),
                            Text(
                              "Price: ${history.price}",
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            //const Padding(
            //  padding: EdgeInsets.all(15.0),
            //  child: SpinKitPumpingHeart(
            //    color: Colors.red,
            //    size: 36.0,
            //  ),
            //)
            //IconButton(
            //    icon: const Icon(Icons.history, color: Colors.red),
            //    onPressed: () {}),
          ])),
    );
  }
}
