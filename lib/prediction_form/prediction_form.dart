import 'dart:ui';

import 'package:flutter/cupertino.dart';
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
    final price = useState<double>(0);
    final _condition = useState<bool>(false);

    dynamic placeHolder;

    return SingleChildScrollView(
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

     // alignment: Alignment.center,
      child: _condition.value == false || _pcInfo.value == const PcInfo()
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34.0,vertical: 20.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Image.asset(
                  //     "assets/logo.png"
                  // ),
                  Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/home_dark_mode.png'
                        : 'assets/homeee.png',
                    height: 350,
                  ),
                  SizedBox(height: 35.0,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 14.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                    BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),],
                      //
                      // gradient: LinearGradient(colors: [
                      //   Color(0xffabaefa),
                      //   kLightBackgroundColor,
                      // ],
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      // ),

                      border: Border.all(
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(15),
                      //color: Color(0xffabaffa),
                      color: Theme.of(context).backgroundColor,

                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Predict now !",
                          style: Theme.of(context).textTheme.headline1,
                    ),
                        SizedBox(height: 8.0,),
                        Row(
                          children: [
                            Expanded(
                              child: Text('Predict the price of the laptop of your choice in the Algerien market. ',

                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.start,
                              ),
                            ),

                            Container(
                              height: 65.0,
                                decoration: BoxDecoration(
                                  //color: kLightBackgroundColor,
                                    gradient: LinearGradient(
                                         begin: Alignment.bottomLeft,
                                         end: Alignment.topRight,

                                        colors: [
                                          Theme.of(context).primaryColorDark,
                                          Theme.of(context).primaryColorLight,

                                    ]),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: IconButton( onPressed: () async {
                                  placeHolder = await Navigator.of(context)
                                      .push(OnboardingFlow.route());
                                  _pcInfo.value = placeHolder ?? const PcInfo();
                                  price.value = await getPrice(_pcInfo.value);
                                  _condition.value = true;
                                }, icon: Icon(Icons.arrow_forward_ios),color: Colors.white,highlightColor: Colors.pink,),
                            ),

                          ],
                        ),
                      ],
                    ),


                  ),

                  //TODO EXTRACT THIS WIDGET BOI
                  //THIS THE BUTTON Gradient thing
                  // Container(
                  //   width: 210,
                  //   height: 54,
                  //   decoration: BoxDecoration(
                  //       borderRadius:
                  //           const BorderRadius.all(Radius.circular(80)),
                  //       gradient: LinearGradient(colors: [
                  //         // HexColor("#4589D7"),
                  //         // HexColor("#D0A0F7")
                  //         HexColor("#d8a1f9"),
                  //         HexColor("#57ebdf"),
                  //       ])),
                  //   child: ElevatedButton(
                  //       style: ButtonStyle(
                  //           backgroundColor: MaterialStateProperty.all<Color>(
                  //               Colors.transparent),
                  //           shape: MaterialStateProperty.all<
                  //                   RoundedRectangleBorder>(
                  //               RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(80.0),
                  //           ))),
                  //       child: const Text('Predict Now !',
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold, fontSize: 24)),
                  //       onPressed: () async {
                  //         placeHolder = await Navigator.of(context)
                  //             .push(OnboardingFlow.route());
                  //         _pcInfo.value = placeHolder ?? const PcInfo();
                  //         price.value = await getPrice(_pcInfo.value);
                  //         _condition.value = true;
                  //       }),
                  // ),
                ],
              ),
            )
          : PredictionCard(
              pc: _pcInfo.value,
              price: price.value,
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SecondaryAppBar(
        title: "",
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
