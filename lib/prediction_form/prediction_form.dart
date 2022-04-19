import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:proto/components/components.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flow_builder/flow_builder.dart';
import "package:proto/components/components.dart";

import "package:proto/prediction_form/forms/forms.dart";

part 'prediction_form.freezed.dart';
part 'prediction_form.g.dart';

class PredictionForm extends HookWidget {
  //var formkey = GlobalKey<FormState>();
  //var gpuController = TextEditingController();
  //var emailController = TextEditingController();
  //var nameController = TextEditingController();

  PredictionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pcInfo =
        useState<dynamic>(const PcInfo(brand: "", cpuBrand: "", gpuBrand: ""));

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        titleText: "Predidiction Form",
      ),
      body: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: _pcInfo.value ==
                  const PcInfo(brand: "", cpuBrand: "", gpuBrand: "")
              ? ElevatedButton(
                  onPressed: () async {
                    _pcInfo.value = await Navigator.of(context)
                        .push(OnboardingFlow.route());
                  },
                  child: const Text('Oky Lets Goooooo'),
                )
              : const PredictionCard()),
    );
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
      body: FlowBuilder<PcInfo>(
        state: const PcInfo(),
        onGeneratePages: (profile, pages) {
          return [
            MaterialPage(child: FirstForm()),
            if (profile.brand != "") MaterialPage(child: SeconedForm()),
            if (profile.cpuBrand != "") MaterialPage(child: ThirdForm()),
          ];
        },
      ),
    );
  }
}

@freezed
class PcInfo with _$PcInfo {
  const factory PcInfo(
      {@Default("") String brand,
      @Default("") String cpuBrand,
      @Default("") String gpuBrand}) = _PcInfo;

  factory PcInfo.fromJson(Map<String, dynamic> json) => _$PcInfoFromJson(json);
}

