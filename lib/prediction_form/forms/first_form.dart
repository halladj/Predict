import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:proto/prediction_form/model/pc.model.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:proto/components/components.dart';

class FirstForm extends HookWidget {
  //TODO add the controllers and the form key
  var formkey = GlobalKey<FormState>();

  var brandController = TextEditingController();
  var cpuBrandController = TextEditingController();
  var cpuFamilyController = TextEditingController();
  var cpuFrequencyController = TextEditingController();
  var cpuModifierController = TextEditingController();
  var cpuNumberIdentifierController = TextEditingController();
  var hddController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _brand = useState<String>("");
    final _cpuBrand = useState<String>("");
    final _cpuFamily = useState<String>("");
    final _cpuFrequency = useState<double>(0.0);
    final _cpuModifier = useState<String>("");
    final _cpuNumberIdentifier = useState<String>("");
    final _hdd = useState<int>(0);

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

                        //BRAND FIELD
                        //MAYBE PUT A DROPDOWN THING HERE OR SOMETHING
                        TextFormField(
                          autofocus: true,
                          controller: brandController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'brand Must Not Be Embty';
                            }
                          },
                          onChanged: (value) => _brand.value = value,
                          decoration: InputDecoration(
                              labelText: 'Brand',
                              hintText: 'Enter The Brand',
                              suffixIcon: const Icon(Icons.euro_symbol),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //CPU BRAND FIELD
                        //I THING A 2 VALUE SLIDER WOULD BE NICE
                        TextFormField(
                          controller: cpuBrandController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'CPU Brand Must Not Be Embty';
                            }
                          },
                          onChanged: (value) => _cpuBrand.value = value,
                          decoration: InputDecoration(
                              labelText: 'CPU brand',
                              hintText: 'Enter The CPU Brand',
                              suffixIcon: const Icon(Icons.microwave),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //CPU FAMILY
                        //
                        TextFormField(
                          controller: cpuFamilyController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'The CPU Family Must Not Be Empty';
                            }
                          },
                          onChanged: (value) => _cpuFamily.value = value,
                          decoration: InputDecoration(
                              labelText: 'CPU Family',
                              hintText: 'The CPU Family',
                              suffixIcon: const Icon(Icons.family_restroom),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //CPU MODIFIER
                        //
                        TextFormField(
                          controller: cpuModifierController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'CPU Modifier';
                            }
                          },
                          onChanged: (value) => _cpuModifier.value = value,
                          decoration: InputDecoration(
                              labelText: 'CPU Modifier',
                              hintText: 'Enter The CPU Modifier',
                              suffixIcon: const Icon(Icons.numbers),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //CPU FREQUENCY
                        //
                        TextFormField(
                          controller: cpuFrequencyController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'CPU Frequency Must Not Be Embty';
                            }
                          },
                          onChanged: (value) =>
                              _cpuFrequency.value = double.parse(value),
                          decoration: InputDecoration(
                              labelText: 'CPU Frequency',
                              hintText: 'Enter The CPU Frequency',
                              suffixIcon: const Icon(Icons.cake),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //CPU NUMBER IDENTIFIER
                        //DO SOME CHANGES TO THE STYLE
                        TextFormField(
                          controller: cpuNumberIdentifierController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'CPU Number Identifier Must Not Be Embty';
                            }
                          },
                          onChanged: (value) =>
                              _cpuNumberIdentifier.value = value,
                          decoration: InputDecoration(
                              labelText: 'CPU Number Identifier',
                              hintText: 'Enter The CPU Number Identifier',
                              suffixIcon: const Icon(Icons.airplay),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // HDD STORAGE
                        // A SLIDER WOULD LOOK GOOD HERE
                        TextFormField(
                          controller: hddController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'HDD Must Not Be Embty';
                            }
                          },
                          onChanged: (value) => _hdd.value = int.parse(value),
                          decoration: InputDecoration(
                              labelText: 'HDD',
                              hintText: 'Enter HDD Storage size',
                              suffixIcon: const Icon(Icons.storage),
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
                                      brand: _brand.value,
                                      cpuBrand: _cpuBrand.value,
                                      cpuFamily: _cpuFamily.value,
                                      cpuModifier: _cpuModifier.value,
                                      cpuFrequency: _cpuFrequency.value,
                                      cpuNumberIdentifier:
                                          _cpuNumberIdentifier.value,
                                      hdd: _hdd.value));
                            }
                          },
                        )
                      ],
                    ))),
          ),
        ));
  }
}

