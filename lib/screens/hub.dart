import 'package:flutter/material.dart';
import 'package:proto/prediction_form/prediction_form.dart';

class Hub extends StatelessWidget {
  const Hub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PredictionForm(),
    );
  }
}
