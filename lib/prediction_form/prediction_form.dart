import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:proto/components/components.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:dio/dio.dart';

import "package:proto/prediction_form/forms/forms.dart";
import "package:proto/prediction_form/model/pc.model.dart";
//import "package:proto/components/components.dart";

class PredictionForm extends HookWidget {
  //var formkey = GlobalKey<FormState>();
  //var gpuController = TextEditingController();
  //var emailController = TextEditingController();
  //var nameController = TextEditingController();

  const PredictionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pcInfo = useState<dynamic>(const PcInfo());
    final price = useState<int>(0);

    return //Scaffold(
        //appBar: CustomAppBar(
        //  appBar: AppBar(),
        //  titleText: "Predidiction Form",
        //),
        //body:
        SingleChildScrollView(
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
                      print(price.value);
                    },
                  ),
                  InkWell(
                    child: const MainCard(),
                    onTap: () async {
                      _pcInfo.value = await Navigator.of(context)
                          .push(OnboardingFlow.route());
                      price.value = await getPrice(_pcInfo.value);
                      print(price.value);
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

class OnboardingFlow extends StatelessWidget {
  static Route<PcInfo> route() {
    return MaterialPageRoute(builder: (_) => OnboardingFlow());
  }

  @override
  Widget build(BuildContext context) {
    print('INFO: ${const PcInfo()}');
    return Scaffold(
      //appBar: AppBar(),
      body: FlowBuilder<PcInfo>(
        state: const PcInfo(),
        onGeneratePages: (pc, pages) {
          return [
            MaterialPage(child: FirstForm()),
            if (pc.brand != "") MaterialPage(child: SeconedForm()),
            if (pc.ramType != "") MaterialPage(child: ThirdForm()),
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
    print(response.data);
    return response.data['price'];
  } catch (e) {
    print(e);
  }
}

