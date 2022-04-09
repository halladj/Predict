import "package:flutter/material.dart";
import 'package:proto/components/components.dart';

class GeneratedQR extends StatelessWidget {
  const GeneratedQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        titleText: "Generated Qr code",
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: SizedBox(
            height: 500,
            width: 450,
            child: Card(
                child: Center(
              child: Image.asset("image.svg.webp"),
            )),
          ),
        ),
      ),
      //color: Colors.blue
    );
    //);
  }
}

