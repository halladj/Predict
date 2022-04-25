import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:proto/prediction_form/model/pc.model.dart';
import 'package:flow_builder/flow_builder.dart';

class SeconedForm extends HookWidget {
  var formkey = GlobalKey<FormState>();

  var gpuBrandController = TextEditingController();
  var gpuNumberIdentifierController = TextEditingController();
  var gpuVramController = TextEditingController();
  var gpuWordsIdentifierController = TextEditingController();
  var ramController = TextEditingController();
  var ramFrequencyController = TextEditingController();
  var ramTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _gpuBrand = useState<String>("");
    final _gpuNumberIdentifier = useState<String>("");
    final _gpuVram = useState<int>(0);
    final _gpuWordsIdentifier = useState<String>("");
    final _ram = useState<int>(0);
    final _ramFrequency = useState<double>(0.0);
    final _ramType = useState<String>("");

    return Scaffold(
        appBar: AppBar(title: const Text('Brand')),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 20, right: 20),
                child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //TODO ADD A CUSTOM FORMFIELD WIDGET
                        //GPU BRAND FIELD
                        TextFormField(
                          autofocus: true,
                          controller: gpuBrandController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'GPU Brand Must Not Be Embty';
                            }
                          },
                          onChanged: (value) => _gpuBrand.value = value,
                          decoration: InputDecoration(
                              labelText: 'GPU Brand',
                              hintText: 'Enter The GPU Brand',
                              suffixIcon: const Icon(Icons.euro_symbol),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //GPU NUMBER IDENTIFIER
                        //
                        TextFormField(
                          controller: gpuNumberIdentifierController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'GPU Number Identifier Must Not Be Embty';
                            }
                          },
                          onChanged: (value) =>
                              _gpuNumberIdentifier.value = value,
                          decoration: InputDecoration(
                              labelText: 'GPU Number Identifier brand',
                              hintText: 'Enter The GPU Number Identifier',
                              suffixIcon: const Icon(Icons.microwave),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //GPU VRAM
                        // A Slider
                        TextFormField(
                          controller: gpuVramController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'The GPU Vram Must Not Be Empty';
                            }
                          },
                          onChanged: (value) =>
                              _gpuVram.value = int.parse(value),
                          decoration: InputDecoration(
                              labelText: 'GPU VRAM',
                              hintText: 'The GPU VRAM',
                              suffixIcon: const Icon(Icons.cable),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //GPU WORDS Identifier
                        //
                        TextFormField(
                          controller: gpuWordsIdentifierController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'GPU WORDS IDENTIFIER';
                            }
                          },
                          onChanged: (value) =>
                              _gpuWordsIdentifier.value = value,
                          decoration: InputDecoration(
                              labelText: 'GPU WORDS IDENTIFER',
                              hintText: 'Enter The GPU WORDS IDENTIFIER',
                              suffixIcon: const Icon(Icons.numbers),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //RAM
                        //A DROPDOWN MAYBE
                        TextFormField(
                          controller: ramController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'CPU Frequency Must Not Be Embty';
                            }
                          },
                          onChanged: (value) => _ram.value = int.parse(value),
                          decoration: InputDecoration(
                              labelText: 'RAM',
                              hintText: 'Enter The RAM',
                              suffixIcon: const Icon(Icons.cake),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //RAM FREQUENCY
                        //
                        TextFormField(
                          controller: ramFrequencyController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'RAM FREQUCNCY Must Not Be Embty';
                            }
                          },
                          onChanged: (value) =>
                              _ramFrequency.value = double.parse(value),
                          decoration: InputDecoration(
                              labelText: 'RAM FREQUENCY Identifier',
                              hintText: 'Enter The RAM FREQUENCY Identifier',
                              suffixIcon: const Icon(Icons.airplay),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //RAM TYPE
                        //  A DROPDOWN 100%%%%%
                        TextFormField(
                          controller: ramTypeController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'RAM TYPE Must Not Be Embty';
                            }
                          },
                          onChanged: (value) => _ramType.value = value,
                          decoration: InputDecoration(
                              labelText: 'RAM TYPE',
                              hintText: 'Enter THE RAM TYPE',
                              suffixIcon: const Icon(Icons.bedroom_baby),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                          child: const Text('Continre'),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              context.flow<PcInfo>().update((info) =>
                                  info.copyWith(
                                      gpuBrand: _gpuBrand.value,
                                      gpuNumberIdentifier:
                                          _gpuNumberIdentifier.value,
                                      gpuVram: _gpuVram.value,
                                      gpuWordsIdentifier:
                                          _gpuWordsIdentifier.value,
                                      ram: _ram.value,
                                      ramFrequency: _ramFrequency.value,
                                      ramType: _ramType.value));
                            }
                          },
                        )
                      ],
                    ))),
          ),
        ));
  }
}

