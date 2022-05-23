import "package:flutter/material.dart";
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:proto/components/components.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:dio/dio.dart';
import "package:proto/prediction_form/forms/forms.dart";
import "package:proto/prediction_form/model/pc.model.dart";

class PredictionForm extends HookWidget {
  const PredictionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //INTEAD OF USING A STATEFULL WIDGET I USED
    // react_hooks TO HANDLE THE PC STATE << Trust Me its way better>>
    //you delare a varaible with flutter_hooks  vai "useVariable_name"
    final _pcInfo = useState<dynamic>(const PcInfo());
    final price = useState<double>(0);
    final _condition = useState<bool>(false);
    dynamic placeHolder;

    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: _condition.value == false
            ? Padding(
                padding: const EdgeInsets.all(34.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo2.png',
                      height: 60,
                    ),
                    SizedBox(
                      height: 431,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            child: Image.asset(
                              'assets/laptop2.png',
                            ),
                          ),
                          Positioned(
                            top: 204,
                            left: 60,
                            child: Image.asset(
                              'assets/laptop1.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    //TODO EXTRACT THIS WIDGET BOI
                    //THIS THE BUTTON Gradient thing
                    Container(
                      width: 228,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(80)),
                          gradient: LinearGradient(colors: [
                            HexColor("#4589D7"),
                            HexColor("#D0A0F7")
                          ])),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0),
                              ))),
                          child: const Text('Predict Now !',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                          onPressed: () async {
                            placeHolder = await Navigator.of(context)
                                .push(OnboardingFlow.route());
                            _pcInfo.value = placeHolder ?? const PcInfo();
                            _condition.value = true;
                            price.value = await getPrice(_pcInfo.value);
                          }),
                    ),
                  ],
                ),
              )
            : PredictionCard(
                pc: _pcInfo.value,
                price: price.value,
              ),
      ),
    );
  }
}

//THIS IS FOR THE PROGFRESSIVE FORM
//it saves the state and submit it to the server
class OnboardingFlow extends StatelessWidget {
  static Route<PcInfo> route() {
    return MaterialPageRoute(builder: (_) => OnboardingFlow());
  }

  @override
  Widget build(BuildContext context) {
    print('INFO: ${const PcInfo()}');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prediction Form"),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 30),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/");
            }),
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
      body: FlowBuilder<PcInfo>(
        state: const PcInfo(),
        onGeneratePages: (pc, pages) {
          return [
            MaterialPage(
              child: FirstForm(),
            ),
            if (pc.brand != "") MaterialPage(child: SeconedForm()),
            //if (pc.ramType != "") MaterialPage(child: ThirdForm()),
          ];
        },
      ),
    );
  }
}

getPrice(PcInfo data) async {
  try {
    var response = await Dio().post(
        'https://laptops-prediction.herokuapp.com/result',
        data: data.toJson(),
        options: Options(contentType: Headers.jsonContentType));
    return double.parse(response.data['price']);
  } catch (e) {
    print(e);
  }
}
