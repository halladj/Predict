import "package:flutter/material.dart";
import 'package:proto/components/components.dart';
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
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        titleText: "Generated QR code",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: textController.text,
              backgroundColor: Colors.white,
              size: 320,
            ),
            const SizedBox(
              height: 40,
            ),
            buildTextField(context)
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) => TextField(
      controller: textController,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      decoration: InputDecoration(
          hintText: "EnterData",
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: Theme.of(context).secondaryHeaderColor)),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(
                Icons.done,
                size: 30.0,
              ))));
}

