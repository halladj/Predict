import 'package:flutter/material.dart';
import 'package:proto/components/components.dart';
import "package:proto/prediction_form/prediction_form.dart";

class Prediction extends StatelessWidget {
  const Prediction({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Prediction());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: CustomAppBar(
        //  appBar: AppBar(),
        //  titleText: "Predicetion Page",
        //),
        body: const Padding(
            padding: EdgeInsets.all(18.0), //child: PredictionCard(price: 10000)
            child: Text("hahaha")));
  }
}
