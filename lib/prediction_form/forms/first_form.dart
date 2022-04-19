import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:proto/prediction_form/prediction_form.dart';
import 'package:flow_builder/flow_builder.dart';

class FirstForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _brand = useState<String>("");
    return Scaffold(
      appBar: AppBar(title: const Text('Brand')),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              autofocus: true,
              onChanged: (value) => _brand.value = value,
              decoration: const InputDecoration(
                labelText: 'Brand',
                hintText: 'Enter The Brand',
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              child: const Text('Continue'),
              onPressed: () {
                if (_brand.value.isNotEmpty) {
                  context
                      .flow<PcInfo>()
                      .update((info) => info.copyWith(brand: _brand.value));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

