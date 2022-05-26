import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:proto/prediction_form/model/pc.model.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:proto/components/components.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:proto/prediction_form/model/pc.model.dart';
import 'package:proto/prediction_form/prediction_form.dart';

class SeconedForm extends HookWidget {
  var formKey = GlobalKey<FormState>();

  var ssdController = TextEditingController();
  var hddController = TextEditingController();
  var screenSizeController = TextEditingController();
  var screenRefreshRateController = TextEditingController();
  var screenResolutionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _ssd = useState<int>(0);
    final _hdd = useState<int>(0);
    final _screenSize = useState<double>(0);
    final _screenRefreshRate = useState<int>(0);
    final _screenResolution = useState<String>("");
    final _touchScreen = useState<int>(0);
    final _anitGlare = useState<int>(0);
    final _state = useState<int>(0);

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                //insert the column here so we can put that logo
                child: Container(
                    margin: const EdgeInsets.fromLTRB(21, 10, 21, 0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: HexColor("#ebf3fb"),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Form(
                        key: formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                        label: "SSD Storage",
                                        hint: "128, 256 ...",
                                        controller: ssdController,
                                        onChanged: (value) =>
                                            _ssd.value = int.parse(value),
                                        keyboardInputType: TextInputType.number,
                                        autoFocus: false),
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                    child: CustomTextField(
                                        label: "HDD Storage",
                                        hint: "500, 1000 ....",
                                        controller: hddController,
                                        onChanged: (value) =>
                                            _hdd.value = int.parse(value),
                                        keyboardInputType: TextInputType.number,
                                        autoFocus: false),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                        label: "Screen Size",
                                        hint: "13.3, 15.6 ...",
                                        controller: screenSizeController,
                                        onChanged: (value) => _screenSize
                                            .value = double.parse(value),
                                        keyboardInputType: TextInputType.number,
                                        autoFocus: false),
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                    child: CustomTextField(
                                        label: "Screen RefreshRate",
                                        hint: "60, 144 Hz....",
                                        controller: screenRefreshRateController,
                                        onChanged: (value) => _screenRefreshRate
                                            .value = int.parse(value),
                                        keyboardInputType: TextInputType.number,
                                        autoFocus: false),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Screen Resolution",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: HexColor("#7f7f7f"))),
                                  ),
                                  TypeAheadFormField<String>(
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                      controller: screenResolutionController,
                                      decoration: InputDecoration(
                                        hintText: "Full HD",
                                        hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: HexColor("#b4b8bc")),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: HexColor("#848ba3"),
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: HexColor("#4589D7"),
                                              width: 2),
                                        ),
                                      ),
                                    ),
                                    onSuggestionSelected: (String? suggestion) {
                                      final screenResolution = suggestion!;

                                      _screenResolution.value = suggestion;
                                      screenResolutionController.text =
                                          screenResolution;
                                    },
                                    validator: (value) {
                                      var newValue = value!;
                                      if (newValue.isEmpty) {
                                        return 'Screen Resolution cant be Empty';
                                      }
                                    },
                                    itemBuilder: (context, String? suggestion) {
                                      final screenResolution = suggestion!;
                                      return ListTile(
                                        title: Text(screenResolution),
                                      );
                                    },
                                    suggestionsCallback:
                                        Api2.getScreenResolution,
                                    noItemsFoundBuilder: (context) =>
                                        const SizedBox(
                                      height: 100,
                                      child: Center(
                                        child: Text(
                                          "No Screen Resolution was found.",
                                          style: TextStyle(
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              CustomSlider(
                                  label: "touch screen",
                                  max: 1,
                                  min: 0,
                                  divisions: 2,
                                  seconedLabel: _touchScreen.value == 1
                                      ? "touch"
                                      : "not touch",
                                  value: _touchScreen),
                              CustomSlider(
                                  label: "Anti Glare",
                                  max: 1,
                                  min: 0,
                                  divisions: 2,
                                  seconedLabel:
                                      _anitGlare.value == 1 ? "Has" : "No have",
                                  value: _anitGlare),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SelectionField(label: "State", value: _state),
                                  Container(
                                    width: 128,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(80)),
                                        gradient: LinearGradient(colors: [
                                          HexColor("#4589D7"),
                                          HexColor("#D0A0F7")
                                        ])),
                                    child: ElevatedButton(
                                      //TODO FLIP THE BUTON AND THE CONTAINER
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.transparent),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(80.0),
                                          ))),
                                      child: const Text('Predict'),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          context
                                              .flow<PcInfo>()
                                              .complete((info) => info.copyWith(
                                                    ssd: _ssd.value,
                                                    hdd: _hdd.value,
                                                    screenSize:
                                                        _screenSize.value,
                                                    screenRefreshRate:
                                                        _screenRefreshRate
                                                            .value,
                                                    screenResolution:
                                                        _screenResolution.value,
                                                    state: _state.value,

                                                  ));
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ]))))));
  }
}

class Api2 {
  static Future<List<String>> getScreenResolution(String query) async {
    return await ["fhd", "hd", "qhd", "4k", "2k"];
  }
}
