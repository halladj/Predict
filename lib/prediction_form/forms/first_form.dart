import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:proto/prediction_form/model/cpu/cpu.model.dart';
import 'package:proto/prediction_form/model/gpu/gpu.model.dart';
import 'package:proto/prediction_form/model/pc.model.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:proto/theme.dart';
import 'package:proto/components/components.dart';

class FirstForm extends HookWidget {
  var formKey = GlobalKey<FormState>();

  var brandController = TextEditingController();
  var cpuController = TextEditingController();
  var gpuController= TextEditingController();
  var ramController = TextEditingController();
  var ramTypeController = TextEditingController();
  var ramFrequencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    final _brand = useState<String>("");
    final _cpu= useState<CPU>(const CPU());
    final _gpu= useState(const GPU());
    final _ram= useState<int>(0);
    final _ramType= useState<String>("");
    final _ramFrequency= useState<double>(0);
    final _state= useState<int>(0);

    return Scaffold(
        //appBar: AppBar(title: const Text('Brand')),
        body: Container(
      // padding: const EdgeInsets.all(8.0),
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [CustomColors.upperGradientColor, CustomColors.lowerGradientColor],
        ),
      ),
      alignment: Alignment.center,
      child: SingleChildScrollView(
          //insert the column here so we can put that logo
          child: Container(
              margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Form(
                  key: formKey,
                  child: Column(

                    //mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(
                      //height: 200 ,
                      child: Image(image: AssetImage("assets/logo2.png")),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //MAYBE PUT A DROPDOWN THING HERE OR SOMETHING
                      CustomTextField(
                          label: "Brand",
                          icon: Icons.euro,
                          controller: brandController,
                          onChanged: (value) => _brand.value= value,
                          keyboardInputType: TextInputType.text,
                          autoFocus: true),
                      const SizedBox(height: 10.0),
                      //TODO make it a reusable component
                      TypeAheadFormField<CPU?>(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: cpuController,
                            decoration: InputDecoration(
                              labelText: "CPU ",
                              labelStyle: TextStyle(fontSize: 16.0, color: CustomColors.buttonColor),
                              prefixIcon: Icon(Icons.car_rental, color: CustomColors.buttonColor),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: CustomColors.buttonColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: CustomColors.buttonColor),
                              ),
                            ),
                          ),
                          onSuggestionSelected: (CPU? suggestion){
                            final cpu= suggestion!;

                            _cpu.value= _cpu.value.copyWith(
                              name: cpu.name,
                              brand: cpu.brand,
                              modifier: cpu.modifier,
                              generation: cpu.generation,
                              numberIdentifier: cpu.numberIdentifier,
                              family: cpu.family,
                              frequency: cpu.frequency,
                            );
                            cpuController.text= cpu.name;
                          },
                          validator: (value) {
                            var newValue= value!;
                            if (newValue.isEmpty) {
                              return 'CPU Field cant be Empty';
                            }
                          },
                          itemBuilder: (context, CPU? suggestion){
                            final cpu = suggestion!;
                            return ListTile(
                              title: Text(cpu.name),
                            );
                          },
                          suggestionsCallback: Api.getCpuSuggetions,
                          noItemsFoundBuilder: (context)=> const SizedBox(
                            height: 100,
                            child: Center(
                              child: Text(
                                  "No CPU was found.",
                                  style: TextStyle(fontSize: 24, ),
                              ),
                            ),
                          ),
                      ),
                      const SizedBox(height: 10.0),
                      TypeAheadFormField<GPU?>(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: gpuController,
                          decoration: InputDecoration(
                            labelText: "GPU",
                            labelStyle: TextStyle(fontSize: 16.0, color: CustomColors.buttonColor),
                            prefixIcon: Icon(Icons.cake, color: CustomColors.buttonColor),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CustomColors.buttonColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CustomColors.buttonColor),
                            ),
                          ),
                        ),
                        onSuggestionSelected: (GPU? suggestion){
                          final gpu= suggestion!;

                          _gpu.value= _gpu.value.copyWith(
                            name: gpu.name,
                            brand: gpu.brand,
                            wordsIdentifier: gpu.wordsIdentifier,
                            numberIdentifier: gpu.numberIdentifier,
                            vram: gpu.vram,
                            frequency: gpu.frequency,
                          );
                          gpuController.text= gpu.name;
                        },
                        validator: (value) {
                          var newValue= value!;
                          if (newValue.isEmpty) {
                            return 'GPU Field cant be Empty';
                          }
                        },
                        itemBuilder: (context, GPU? suggestion){
                          final gpu = suggestion!;
                          return ListTile(
                            title: Text(gpu.name),
                          );
                        },
                        suggestionsCallback: Api.getGpuSuggetions,
                        noItemsFoundBuilder: (context)=> const SizedBox(
                          height: 100,
                          child: Center(
                            child: Text(
                              "No CPU was found.",
                              style: TextStyle(fontSize: 24, ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      // HDD STORAGE
                      // A SLIDER WOULD LOOK GOOD HERE
                      CustomTextField(
                          label: "RAM",
                          icon: Icons.leaderboard,
                          controller: ramController,
                          onChanged: (value)=> _ram.value= int.parse(value),
                          keyboardInputType: TextInputType.number,
                          autoFocus: false),
                      const SizedBox(height: 10.0),
                      CustomTextField(
                          label: "RAM Type",
                          icon: Icons.bookmark_add,
                          controller: ramTypeController,
                          onChanged: (value)=>_ramType.value= value,
                          keyboardInputType: TextInputType.text,
                          autoFocus: false),
                      const SizedBox(height: 12.0),
                      CustomTextField(
                          label: "RAM Frequency",
                          icon: Icons.anchor_outlined,
                          controller: ramFrequencyController,
                          onChanged: (value)=>_ramFrequency.value= double.parse(value),
                          keyboardInputType: TextInputType.number,
                          autoFocus: false),
                      const SizedBox(height: 12.0),
                      SelectionField(label: "State", value: _state),
                      ElevatedButton(
                        child: const Text('Continre'),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.flow<PcInfo>().update((info) => info.copyWith(
                                brand: _brand.value,
                                cpu: _cpu.value,
                                gpu: _gpu.value,
                                ram: _ram.value,
                                ramType: _ramType.value,
                                ramFrequency: _ramFrequency.value,
                                state: _state.value));
                          }
                        },
                      )
                    ],
                  )))),
    ));
  }
}


class Api{
  static Future<List<CPU>> getCpuSuggetions(String query) async{
    final response= await rootBundle.loadString("assets/cpu_data.json");
    final List cpus= json.decode(response);

    return cpus.map( (json) => CPU.fromJson(json)).where((cpu){
      final cpuLower= cpu.name.toLowerCase();
      final queryLower= query.toLowerCase();
      return cpuLower.contains(queryLower);
    }).toList();
  }

  static Future<List<GPU>> getGpuSuggetions(String query) async{
    final response= await rootBundle.loadString("assets/gpu_data.json");
    final List gpus= json.decode(response);

    return gpus.map( (json) => GPU.fromJson(json)).where((gpu){
      final gpuLower= gpu.name.toLowerCase();
      final queryLower= query.toLowerCase();
      return gpuLower.contains(queryLower);
    }).toList();
  }
}
