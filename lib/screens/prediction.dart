import 'package:flutter/material.dart';
import "package:proto/prediction_form/prediction_form.dart";

class Prediction extends StatelessWidget {
  const Prediction({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Prediction());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:0,horizontal: 8.0),
      child: Center(
        child: Container(
          //mainAxisAlignment: MainAxisAlignment.center,
          child:
            PredictionForm(),
            //const MainCard(),
            //ElevatedButton(
            //    onPressed: () {
            //      Navigator.pushNamed(context, '/predition_form');
            //},
            //child: const Text("Predition Form"))

        ),
      ),
    );
  }
}

