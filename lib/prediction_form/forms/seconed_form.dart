import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:proto/prediction_form/prediction_form.dart';
import 'package:flow_builder/flow_builder.dart';

class SeconedForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _cpuBrand = useState<String>("");
    return Scaffold(
      appBar: AppBar(title: const Text('CPU Brand')),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButtonFormField<int>(
              items: List.generate(
                20,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(index.toString()),
                ),
              ),
              onChanged: (value) => _cpuBrand.value = value.toString(),
              decoration: const InputDecoration(
                labelText: 'CPU Brand',
                hintText: 'Where CPU Brand boi',
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              child: const Text('Continue'),
              onPressed: () {
                if (_cpuBrand.value != "") {
                  context.flow<PcInfo>().update(
                      (info) => info.copyWith(cpuBrand: _cpuBrand.value));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

