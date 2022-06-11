import 'dart:io';
import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:proto/components/prediction_card.dart';
import 'package:proto/helpers/api/predictions.dart';
import 'package:proto/prediction_form/model/cpu/cpu.model.dart';
import 'package:proto/prediction_form/model/gpu/gpu.model.dart';
import 'package:proto/prediction_form/model/pc.model.dart';
import 'package:proto/screens/generated_qr_code.dart';
import 'package:proto/screens/prediction.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanner extends StatefulWidget {
  const QRCodeScanner({Key? key}) : super(key: key);

  @override
  State<QRCodeScanner> createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QRCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  double price = 0.0;
  var data;
  int condition = 1;
  //TODO try to find some solution for this bug
  //the bug is that u have to change the screen from
  //the buttomnav to be able to recane a new code

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        buildQrView(context),
        Positioned(
          child: buildResult(),
          bottom: 10,
        ),
        Positioned(
          child: buildControllButtons(),
          top: 10,
        )
      ],
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderWidth: 10,
            borderRadius: 10,
            borderColor: Theme.of(context).secondaryHeaderColor,
            borderLength: 20,
            cutOutSize: MediaQuery.of(context).size.width * 0.8),
      );

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
        data = result?.code.toString();
      });
      if (condition == 1) {
        var response = await QrCodeApi.scanQrCode(hash: data);
        price = double.parse(response["price"]);
        condition++;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Prediction(
                    pc: PcInfo(
                        brand: response["brand"],
                        cpu: CPU(
                          brand: response["cpu_brand"],
                          family: response["cpu_family"],
                          modifier: response["cpu_modifier"],
                          numberIdentifier: response["cpu_number_identifier"],
                        ),
                        gpu: GPU(
                            brand: response["gpu_brand"],
                            numberIdentifier:
                                response["cpu_number_identifier"].toString(),
                            vram: response["gpu_vram"]),
                        ram: response["ram"],
                        ramType: response["ram_type"],
                        ramFrequency:
                            double.parse(response["ram_frequency"].toString()),
                        hdd: response["hdd"],
                        ssd: response["ssd"],
                        screenSize:
                            double.parse(response["screen_size"].toString()),
                        screenResolution: response["screen_resolution"],
                        screenRefreshRate: response["screen_refresh_rate"],
                        state: response["state"],
                        touchScreen: response["touch_screen"]),
                    price: price)));
        //Navigator.pushNamed(context, "/generatedQR",
        //    arguments: Arguments(
        //        hash: data.toString(), price: price, laptop: const PcInfo()));
      }
    });
    //print("fuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuck");
    //print(data);
    //price = await scanQrCode(hash: data);

    //print("fuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuck");
    //Navigator.push(
    //    context,
    //    MaterialPageRoute(
    //        builder: (context) =>
    //            PredictionCard(pc: const PcInfo(), price: price)));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget buildResult() => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white24),
        child: Text(
          result != null ? "Resualt: ${result!.code}" : "Scan a code",
          maxLines: 3,
        ),
      );

  Widget buildControllButtons() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white24, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                icon: FutureBuilder<bool?>(
                    future: controller?.getFlashStatus(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return Icon(
                            snapshot.data! ? Icons.flash_on : Icons.flash_off);
                      } else {
                        return Container();
                      }
                    })),
            IconButton(
                onPressed: () async {
                  await controller?.flipCamera();
                  setState(() {});
                },
                icon: FutureBuilder(
                  future: controller?.getCameraInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return const Icon(Icons.switch_camera);
                    } else {
                      return Container();
                    }
                  },
                ))
          ],
        ),
      );
}
