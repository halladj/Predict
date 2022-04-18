import 'dart:io';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
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
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
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
                  },
                )),
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

