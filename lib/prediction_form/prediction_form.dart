import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:proto/app_bloc/app_bloc.dart';
import 'package:proto/components/components.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:dio/dio.dart';
import 'package:proto/helpers/api/predictions.dart';
import 'package:proto/home/home_cubit.dart';
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
    HomeCubit homeCubit = context.watch<HomeCubit>();
    AppStatus status = context.select((AppBloc bloc) => bloc.state.status);
    final user = context.select((AppBloc bloc) => bloc.state.user);

    dynamic placeHolder;
    //TODO MAKE A USEEFFECT TO RESET THE _pcInfo var

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
      child: homeCubit.condition == false || _pcInfo.value == const PcInfo()
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 34.0, vertical: 20.0),
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
                  const SizedBox(
                    height: 45.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 14.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
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
                        Text(
                          "Predict now !",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Predict the price of the laptop of your choice in the Algerien market. ',
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Container(
                              height: 65.0,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Theme.of(context).primaryColorDark,
                                      Theme.of(context).primaryColorLight,
                                    ]),
                              ),
                              child: IconButton(
                                onPressed: () async {
                                  placeHolder = await Navigator.of(context)
                                      .push(OnboardingFlow.route());
                                  _pcInfo.value = placeHolder ?? const PcInfo();
                                  homeCubit.changePredictionFormCondition(
                                      value: true);
                                  price.value = await getPrice(_pcInfo.value);
                                  if (status == AppStatus.authenticated) {}
                                  HistoryApi.addToHistory(
                                      pc: _pcInfo.value,
                                      price: price.value,
                                      token: user.token);
                                },
                                icon: const Icon(Icons.arrow_forward_ios),
                                color: Colors.white,
                                highlightColor: Colors.pink,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : price.value == -1.toDouble()
              ? Padding(
        padding: EdgeInsets.symmetric(horizontal: 180,vertical: 250),
          child: CircularProgressIndicator(),
      )
              : PredictionCard(
                  pc: _pcInfo.value,
                  price: price.value,
                ),
    );

//                  ),

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
//                ],
//              ),
//            )

//    );
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
    return SafeArea(
      child: Scaffold(
      appBar: SecondaryAppBar(
        title: 'Prediction Form',
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
    return response.data['price'];
  } catch (e) {
    print(e);
  }
}
