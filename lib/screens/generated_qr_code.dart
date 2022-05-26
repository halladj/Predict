import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:proto/components/components.dart';
import 'package:proto/prediction_form/model/pc.model.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratedQR extends StatefulWidget {
  const GeneratedQR({Key? key}) : super(key: key);

  @override
  State<GeneratedQR> createState() => _GeneratedQRState();
}

class _GeneratedQRState extends State<GeneratedQR> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final params = ModalRoute.of(context)!.settings.arguments as Arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 30),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text("Predictionpage", style: TextStyle(fontSize: 24)),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: QrImage(
            //data: textController.text,
            //TODO MAKE AN THIS A STATELESS WIDGET BOY
            data: params.hash.toString(),
            backgroundColor: Colors.white,
            size: 320,
          ),
        ),
      ),
    );
  }
}

class Arguments {
  Arguments({required this.hash, required this.price});

  String hash;
  double price;
}
