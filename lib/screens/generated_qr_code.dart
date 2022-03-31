import "package:flutter/material.dart";

class GeneratedQR extends StatelessWidget {
  const GeneratedQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//            leading: const Icon(Icons.logo_dev)          ,
        title: const Text("GeneratedQR", style: TextStyle(color: Colors.black)),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 10.0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            iconSize: 34.0,
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logo_dev),
              color: Colors.black),
        ],
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

