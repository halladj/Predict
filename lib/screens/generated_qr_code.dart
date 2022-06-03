import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:proto/app_bloc/app_bloc.dart';
import 'package:proto/components/components.dart';
import 'package:proto/helpers/api/predictions.dart';

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
  bool isFetched = false;
  PcInfo laptop = const PcInfo();

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    final params = ModalRoute.of(context)!.settings.arguments as Arguments;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          appBar: AppBar(),
          titleText: "Generated QR code",
          homeCubit: HomeCubit(),
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
                  child: QrImage(
                    //data: textController.text,
                    //TODO MAKE AN THIS A STATELESS WIDGET BOY
                    data: params.hash.toString(),
                    backgroundColor: Colors.white,
                    foregroundColor: HexColor("#726eff"),
                    size: 320,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 190,
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
                            const BorderRadius.all(Radius.circular(20))),
                  ),
                  const SizedBox(width: 30),
                  !isFetched
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
                        ),
                ],
              ),
              const SizedBox(height: 130)
            ],
          ),
        ),
      ),
    );
  }
}

class Arguments {
  Arguments({required this.hash, required this.laptop, required this.price});

  String hash;
  PcInfo laptop;
  double price;
}
