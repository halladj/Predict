import "package:flutter/material.dart";
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
    final price = useState<int>(0);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: _pcInfo.value == const PcInfo()
            ? Column(
                children: [
                  InkWell(
                    child: const MainCard(),
                    onTap: () async {
                      _pcInfo.value = await Navigator.of(context)
                          .push(OnboardingFlow.route());
                      price.value = await getPrice(_pcInfo.value);
                    },
                  ),
                  InkWell(
                    child: const MainCard(),
                    onTap: () async {
                      _pcInfo.value = await Navigator.of(context)
                          .push(OnboardingFlow.route());
                      price.value = await getPrice(_pcInfo.value);
                    },
                  ),
                ],
              )
            : InkWell(
                child: PredictionCard(
                //TODO add a field in the pcInfo model to
                //prevent the load of the prediction card if no
                //prediction is made
                price: price.value,
              )),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prediction Form"),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
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
    var response =
        await Dio().post('http://192.168.1.18:3000', data: data.toJson());
    return response.data['price'];
  } catch (e) {
    print(e);
  }
}
