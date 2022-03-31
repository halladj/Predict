import "package:flutter/material.dart";

class QRCodeScanner extends StatelessWidget {
  const QRCodeScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: SizedBox(
          height: 700,
          width: 550,
          child: Card(
            child: Card(
                child: Center(
              child: Image.asset("image.svg.webp"),
            )),
          ),
        ),
      ),
      //           color: Colors.red
    );
  }
}

