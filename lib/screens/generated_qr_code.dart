import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:proto/components/components.dart';

import 'package:proto/home/home_cubit.dart';
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

      appBar: CustomAppBar(
        appBar: AppBar(),
        titleText: "Generated QR code", homeCubit: HomeCubit(), icon: true,
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
