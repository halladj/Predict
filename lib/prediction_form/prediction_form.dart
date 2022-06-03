import "package:flutter/material.dart";
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:proto/components/components.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:dio/dio.dart';
import 'package:proto/constants.dart';
import 'package:proto/home.dart';
import "package:proto/prediction_form/forms/forms.dart";
import "package:proto/prediction_form/model/pc.model.dart";

import '../components/secondary_app_bar.dart';

class PredictionForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    //INTEAD OF USING A STATEFULL WIDGET I USED
    // react_hooks TO HANDLE THE PC STATE << Trust Me its way better>>
    //you delare a varaible with flutter_hooks  vai "useVariable_name"
    final _pcInfo = useState<dynamic>(const PcInfo());
    final price = useState<double>(-1);
    final _condition = useState<bool>(false);
    dynamic placeHolder;

    return SingleChildScrollView(
      child: Container(
//         padding: const EdgeInsets.all(0),
//         alignment: Alignment.topCenter,
//         child:

//         _pcInfo.value == const PcInfo() || price.value==0
//             ? Column(

//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 20.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                                 padding: EdgeInsets.only(left: 10.0),
//                                 height:160,width: 200,child: Image.asset('assets/light_laptop.png')),
//                           ],
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Container(
//                               padding: EdgeInsets.only(right: 10.0),
//                                 height:160,width: 200,child: Image.asset('assets/laptop3.png')),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),

//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 8.0),

//                           decoration: BoxDecoration(

//                             gradient: LinearGradient(colors: [
//                               Colors.blue.withOpacity(0.08),
//                               Colors.blue.withOpacity(0.025),
//                             ],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                             border: Border.all(
//                               color: Colors.white.withOpacity(0.3),
//                             ),
//                               borderRadius: BorderRadius.circular(20),

//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 20.0),
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0 ),
//                                   child: Text("Predict the price of the laptop of your choice in the Algerian market.",
//                                   style: TextStyle(
//                                     fontSize: 23,
//                                     //fontWeight: FontWeight.w500,
//                                     color: Color(0xff06446C),
//                                   ),),
//                                 ),

//                               ],
//                             ),
//                           )),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 5.0),
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           primary: Color(0xff00CBBF),
//                         ),
//                       child: Text('Prediction Form'),
//                       onPressed: () async{

//                         _pcInfo.value = await Navigator.of(context)
//                             .push(OnboardingFlow.route());
//                         price.value = await getPrice(_pcInfo.value);
//                       },
//                     ),
//                   ),

//                 ],
//               )
//             : Column(
//               children: [
//                 PredictionCard(
//                 //TODO add a field in the pcInfo model to
//                 //prevent the load of the prediction card if no
//                 //prediction is made
//                 price: price.value,
//                   ),

//               ],
//             ),

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
            : price.value == -1
                ? const Center(child: CircularProgressIndicator())
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

//     return Container(
//       decoration: BoxDecoration(

//         image: DecorationImage(image: AssetImage("assets/light_backgrounddd.png"),fit: BoxFit.fitHeight,

//         ),

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
      body: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const SecondaryAppBar(
          title: "Prediction Form",
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
