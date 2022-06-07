import 'dart:io';
import 'dart:typed_data';

import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:proto/app_bloc/app_bloc.dart';
import 'package:proto/components/components.dart';
import 'package:proto/helpers/api/predictions.dart';

import 'package:proto/home/home_cubit.dart';
import 'package:proto/prediction_form/model/pc.model.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:davinci/davinci.dart';
import 'package:davinci/core/davinci_capture.dart';
import 'package:share_plus/share_plus.dart';

class GeneratedQR extends StatefulWidget {
  const GeneratedQR({Key? key}) : super(key: key);

  @override
  State<GeneratedQR> createState() => _GeneratedQRState();
}

class _GeneratedQRState extends State<GeneratedQR> {
  final textController = TextEditingController();
  bool isFetched = false;
  PcInfo laptop = const PcInfo();
  GlobalKey? imageKey;

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    var authState = context.select((AppBloc bloc) => bloc.state.status);
    final params = ModalRoute.of(context)!.settings.arguments as Arguments;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          appBar: AppBar(),
          titleText: "Generated QR code",
          homeCubit: HomeCubit(),
          icon: true,
        ),
        // ignore: sized_box_for_whitespace
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Davinci(builder: (key) {
                    imageKey = key;
                    return QrImage(
                      //data: textController.text,
                      //TODO MAKE AN THIS A STATELESS WIDGET BOY
                      data: params.hash.toString(),
                      backgroundColor: Colors.white,
                      foregroundColor: HexColor("#726eff"),
                      size: 320,
                    );
                  }),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 50,
                    child: const Center(
                        child: Text("scan",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.black,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                  ),
                  authState == AppStatus.authenticated
                      ? !isFetched
                          ? IconButton(
                              padding: const EdgeInsets.all(0),
                              icon: const Icon(Icons.favorite_border),
                              //TODO HERE IS THE FUNCTION CALL
                              onPressed: () async {
                                print(params.laptop.runtimeType);
                                print(
                                    "fuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuck");
                                var data = await FavoriteApi.addToFavorites(
                                    token: user.token,
                                    pc: params.laptop,
                                    price: params.price);
                                print(
                                    "fuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuck");

                                var pc = PcInfo.fromJson(data);
                                setState(() {
                                  laptop = pc;
                                  isFetched = true;
                                });
                              },
                              iconSize: 48)
                          : const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: SpinKitPumpingHeart(
                                color: Colors.red,
                                size: 48.0,
                              ),
                            )
                      : const SizedBox(width: 10),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.black,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    //padding: const EdgeInsets.all(3),
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.ios_share),
                      onPressed: () async {
                        //NOTE HAVE CHANGED THE FILE captured.davinci and
                        // added  return statement in line:32
                        var qr = await DavinciCapture.click(imageKey!,
                            openFilePreview: false, returnImageUint8List: true);
                        _shareImage(qr);
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 130)
            ],
          ),
        ),
      ),
    );
  }

  _shareImage(Uint8List qr) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/image.jpg').create();
      file.writeAsBytesSync(qr);
      Share.shareFiles([file.path], text: "Qr Code");
    } catch (e) {
      print('Share error: $e');
    }
  }
}

class Arguments {
  Arguments({required this.hash, required this.laptop, required this.price});

  String hash;
  PcInfo laptop;
  double price;
}
