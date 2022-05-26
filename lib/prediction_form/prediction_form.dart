
import 'dart:ui';

import "package:flutter/material.dart";
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

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(0),
        alignment: Alignment.topCenter,
        child:

        _pcInfo.value == const PcInfo() || price.value==0
            ? Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 10.0),
                                height:160,width: 200,child: Image.asset('assets/light_laptop.png')),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10.0),
                                height:160,width: 200,child: Image.asset('assets/laptop3.png')),
                          ],
                        ),
                      ],
                    ),
                  ),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),

                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),

                          decoration: BoxDecoration(

                            gradient: LinearGradient(colors: [
                              Colors.blue.withOpacity(0.08),
                              Colors.blue.withOpacity(0.025),
                            ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                            ),
                              borderRadius: BorderRadius.circular(20),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 20.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0 ),
                                  child: Text("Predict the price of the laptop of your choice in the Algerian market.",
                                  style: TextStyle(
                                    fontSize: 23,
                                    //fontWeight: FontWeight.w500,
                                    color: Color(0xff06446C),
                                  ),),
                                ),

                              ],
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 5.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff00CBBF),
                        ),
                      child: Text('Prediction Form'),
                      onPressed: () async{

                        _pcInfo.value = await Navigator.of(context)
                            .push(OnboardingFlow.route());
                        price.value = await getPrice(_pcInfo.value);
                      },
                    ),
                  ),

                ],
              )
            : Column(
              children: [
                PredictionCard(
                //TODO add a field in the pcInfo model to
                //prevent the load of the prediction card if no
                //prediction is made
                price: price.value,
                  ),

              ],
            ),
      ),
    );
    ;
    //);
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
    return Container(
      decoration: BoxDecoration(

        image: DecorationImage(image: AssetImage("assets/light_backgrounddd.png"),fit: BoxFit.fitHeight,

        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: SecondaryAppBar(title:"Prediction Form",),
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
    var response = await Dio().post('http://laptops-prediction.herokuapp.com/result',
        data: data.toJson(),
        options: Options(contentType: Headers.jsonContentType));
    return double.parse(response.data['price']);

  } catch (e) {
    print(e);
  }
}
