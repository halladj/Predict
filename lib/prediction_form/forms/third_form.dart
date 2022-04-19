import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:proto/prediction_form/prediction_form.dart';

class ThirdForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _gpuBrand = useState<String>("");
    return Scaffold(
      appBar: AppBar(title: const Text('GPU brand')),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //put that fucker here  boi,
            TextField(
              autofocus: true,
              onChanged: (value) => _gpuBrand.value = value,
              decoration: const InputDecoration(
                labelText: 'Brand',
                hintText: 'Enter The Brand',
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              child: const Text('Continue'),
              onPressed: () {
                if (_gpuBrand.value != "") {
                  context.flow<PcInfo>().complete(
                      (info) => info.copyWith(gpuBrand: _gpuBrand.value));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

