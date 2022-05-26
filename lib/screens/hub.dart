import "package:flutter/material.dart";
import "package:proto/components/components.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/home/home_cubit.dart';
import "package:proto/prediction_form/prediction_form.dart";

class Hub extends StatelessWidget {
  const Hub({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Hub());
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: PredictionForm(),
    );
  }
}
