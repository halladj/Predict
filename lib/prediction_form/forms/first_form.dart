import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:proto/prediction_form/model/cpu/cpu.model.dart';
import 'package:proto/prediction_form/model/gpu/gpu.model.dart';
import 'package:proto/prediction_form/model/pc.model.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:proto/components/components.dart';

class FirstForm extends HookWidget {
  var formKey = GlobalKey<FormState>();

  var brandController = TextEditingController();
  var cpuController = TextEditingController();
  var gpuController = TextEditingController();
  var ramController = TextEditingController();
  var ramTypeController = TextEditingController();
  var ramFrequencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;

    final _brand = useState<String>("");
    final _cpu = useState<CPU>(const CPU());
    final _gpu = useState(const GPU());
    final _ram = useState<int>(0);
    final _ramType = useState<String>("");
    final _ramFrequency = useState<double>(0);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 0, right: 5.0, left: 5.0),
        child: SingleChildScrollView(
          //insert the column here so we can put that logo
          child: Column(
            children: [
              const SizedBox(
                height: 55,
                child: FormIcon(),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                // height: 360.0,
                //
                // width: 500.0,

                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Theme.of(context).backgroundColor,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.1),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.fromLTRB(21, 10, 21, 0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                // decoration: BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.5),
                //       spreadRadius: 2,
                //       blurRadius: 5,
                //       offset: const Offset(0, 3), // changes position of shadow
                //     ),
                //   ],
                //   color: kLightCardColor,
                //   borderRadius: BorderRadius.circular(25.0),
                // ),
                child: Form(
                    key: formKey,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // const SizedBox(
                        // //height: 200 ,
                        // child: Image(image: AssetImage("assets/logo2.png")),
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        //MAYBE PUT A DROPDOWN THING HERE OR SOMETHING
                        CustomTextField(
                            label: "Brand",
                            hint: "hp, dell ......",
                            controller: brandController,
                            onChanged: (value) => _brand.value = value,
                            keyboardInputType: TextInputType.text,
                            autoFocus: true),
                        //TODO make it a reusable component
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 2.0),
                              child: Text(
                                "CPU",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blueGrey.withOpacity(0.8),
                                ),
                              ),
                            ),
                            TypeAheadFormField<CPU?>(
                              textFieldConfiguration: TextFieldConfiguration(
                                controller: cpuController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  hintText: "Intel® Core™ i7 8565U",
                                  hintStyle: TextStyle(
                                      fontSize: 16, color: HexColor("#b4b8bc")),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.1),
                                        width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xff35e0d2), width: 2),
                                  ),
                                ),
                              ),
                              onSuggestionSelected: (CPU? suggestion) {
                                final cpu = suggestion!;

                                _cpu.value = _cpu.value.copyWith(
                                  name: cpu.name,
                                  brand: cpu.brand,
                                  modifier: cpu.modifier,
                                  generation: cpu.generation,
                                  numberIdentifier: cpu.numberIdentifier,
                                  family: cpu.family,
                                  frequency: cpu.frequency,
                                );
                                cpuController.text = cpu.name;
                              },
                              validator: (value) {
                                var newValue = value!;
                                if (newValue.isEmpty) {
                                  return 'CPU Field cant be Empty';
                                }
                                return null;
                              },
                              itemBuilder: (context, CPU? suggestion) {
                                final cpu = suggestion!;
                                return ListTile(
                                  title: Text(cpu.name),
                                );
                              },
                              suggestionsCallback: Api.getCpuSuggetions,
                              noItemsFoundBuilder: (context) => const SizedBox(
                                height: 100,
                                child: Center(
                                  child: Text(
                                    "No CPU was found.",
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 2.0),
                              child: Text(
                                "GPU",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blueGrey.withOpacity(0.8),
                                ),
                              ),
                            ),
                            TypeAheadFormField<GPU?>(
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: gpuController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    hintText: "NVIDIA GeForce RTX™ 3060",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: HexColor("#b4b8bc")),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.1),
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color(0xff35e0d2), width: 2),
                                    ),
                                  ),
                                ),
                                itemBuilder: (context, GPU? suggestion) {
                                  final gpu = suggestion!;
                                  return ListTile(
                                    title: Text(gpu.name),
                                  );
                                },
                                suggestionsCallback: Api.getGpuSuggetions,
                                noItemsFoundBuilder: (context) =>
                                    const SizedBox(
                                      height: 100,
                                      child: Center(
                                        child: Text(
                                          "No CPU was found.",
                                          style: TextStyle(
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                onSuggestionSelected: (GPU? suggestion) {
                                  final gpu = suggestion!;

                                  _gpu.value = _gpu.value.copyWith(
                                    name: gpu.name,
                                    brand: gpu.brand,
                                    wordsIdentifier: gpu.wordsIdentifier,
                                    numberIdentifier: gpu.numberIdentifier,
                                    vram: gpu.vram,
                                    frequency: gpu.frequency,
                                  );
                                  gpuController.text = gpu.name;
                                },
                                validator: (value) {
                                  var newValue = value!;
                                  if (newValue.isEmpty) {
                                    return 'GPU Field cant be Empty';
                                  }
                                  return null;
                                }),
                          ],
                        ),
                        // HDD STORAGE
                        // A SLIDER WOULD LOOK GOOD HERE
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                  label: "RAM",
                                  hint: "8, 16 ...",
                                  controller: ramController,
                                  onChanged: (value) =>
                                      _ram.value = int.parse(value),
                                  keyboardInputType: TextInputType.number,
                                  autoFocus: false),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: CustomTextField(
                                  label: "RAM Type",
                                  hint: "ddr4, ddr3 ....",
                                  controller: ramTypeController,
                                  onChanged: (value) => _ramType.value = value,
                                  keyboardInputType: TextInputType.text,
                                  autoFocus: false),
                            ),
                          ],
                        ),
                        CustomTextField(
                            label: "RAM Frequency",
                            hint: "2999, 3213",
                            controller: ramFrequencyController,
                            onChanged: (value) =>
                                _ramFrequency.value = double.parse(value),
                            keyboardInputType: TextInputType.number,
                            autoFocus: false),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                            child: Center(
                                child: Container(
                              width: 420,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Theme.of(context).primaryColorDark,
                                        Theme.of(context).primaryColorLight,
                                      ])),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.transparent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'More specifications',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 22.0, color: Colors.white),
                                  ],
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context
                                        .flow<PcInfo>()
                                        .update((info) => info.copyWith(
                                              brand: _brand.value,
                                              cpu: _cpu.value,
                                              gpu: _gpu.value,
                                              ram: _ram.value,
                                              ramType: _ramType.value,
                                              ramFrequency: _ramFrequency.value,
                                            ));
                                  }
                                },
                              ),
                              // HDD STORAGE
                              // A SLIDER WOULD LOOK GOOD HERE
                            )))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormIcon extends StatelessWidget {
  const FormIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Image(
            image: AssetImage(
            "assets/logo_dark3.png",
          ))
        : const Image(
            image: AssetImage(
            "assets/logo3.png",
          ));
  }
}

class Api {
  static Future<List<CPU>> getCpuSuggetions(String query) async {
    final response = await rootBundle.loadString("assets/cpu_data.json");
    final List cpus = json.decode(response);

    return cpus.map((json) => CPU.fromJson(json)).where((cpu) {
      final cpuLower = cpu.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return cpuLower.contains(queryLower);
    }).toList();
  }

  static Future<List<GPU>> getGpuSuggetions(String query) async {
    final response = await rootBundle.loadString("assets/gpu_data.json");
    final List gpus = json.decode(response);

    return gpus.map((json) => GPU.fromJson(json)).where((gpu) {
      final gpuLower = gpu.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return gpuLower.contains(queryLower);
    }).toList();
  }
}
