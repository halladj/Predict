import "package:flutter/material.dart";
import 'package:proto/components/components.dart';
import "package:proto/prediction_form/model/pc.model.dart";

class PredictionCard extends StatelessWidget {
  const PredictionCard({Key? key, required this.price}) : super(key: key);
  final int price;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(shrinkWrap: true, children: [
        Container(
          constraints: const BoxConstraints.expand(
            width: 350,
            height: 420,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/pc.jpeg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Stack(
            children: [
              //add dark overlay boxDecoratoin
              Container(
                decoration: const BoxDecoration(
                    //color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              //add container ,column, icon and text

              //add widget with chip widget
              //Center(
              //child:
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                children: [
                  Chip(
                    label: const Text(
                      "intel i7",
                      //style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.1),
                    onDeleted: () {
                      print("deleted");
                    },
                  ),
                  Chip(
                    label: const Text(
                      "GTX 1080",
                      //style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.1),
                    onDeleted: () {
                      print("deleted");
                    },
                  ),
                  Chip(
                    label: const Text(
                      "13.3'",
                      //style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                  Chip(
                    label: const Text(
                      "16GB RAM",
                      //style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                  Chip(
                    label: const Text(
                      "256GB ssd",
                      //style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                  Chip(
                    label: const Text(
                      "512GB hdd",
                      //style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                  Chip(
                    label: const Text(
                      "60GHZ",
                      //style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                  Chip(
                    label: const Text(
                      "4K",
                      //style: FooderlichTheme.darkTextTheme.bodyText1,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              //),
              Positioned(
                width: 355,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        price.toString(),
                        style: TextStyle(fontSize: 40.0),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      const Text(
                        "DZD",
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                bottom: 5,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/generatedQR");
            },
            child: const Text("Generate QR code"))
      ]),
    );
    ;
  }
}

