import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:proto/prediction_form/model/pc.model.dart';

class ThirdForm extends HookWidget {
  var formkey = GlobalKey<FormState>();

  var ssdController = TextEditingController();
  var screenRefreshRateController = TextEditingController();
  var screenSizeController = TextEditingController();
  var screenResolutionController = TextEditingController();
  var antiGlareController = TextEditingController();
  var touchScreenController = TextEditingController();
  var stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _ssd = useState<int>(0);
    final _screenRefreshRate = useState<int>(0);
    final _screenSize = useState<double>(0.0);
    final _screenResolution = useState<String>("");
    final _antiGlare = useState<int>(0);
    final _touchScreen = useState<int>(0);
    final _state = useState<int>(0);

    return Scaffold(
        //appBar: AppBar(title: const Text('Brand')),
        body: Container(
      //padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //TODO ADD A CUSTOM FORMFIELD WIDGET
                    //SSD STORAGE FIELD
                    TextFormField(
                      autofocus: true,
                      controller: ssdController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'SSD Must Not Be Embty';
                        }
                      },
                      onChanged: (value) => _ssd.value = int.parse(value),
                      decoration: InputDecoration(
                          labelText: 'SSD STORAGE',
                          hintText: 'Enter The SSD STORAGE',
                          suffixIcon: const Icon(Icons.euro_symbol),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // // SCREEN REFRESH-RATE
                    // //
                    // TextFormField(
                    //   controller: screenRefreshRateController,
                    //   keyboardType: TextInputType.number,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'SCREEN REFRESH RATE Must Not Be Embty';
                    //     }
                    //   },
                    //   onChanged: (value) =>
                    //       _screenRefreshRate.value = int.parse(value),
                    //   decoration: InputDecoration(
                    //       labelText: 'Sceeen RefreshRate',
                    //       hintText: 'Enter The Screen RefreshRate',
                    //       suffixIcon: const Icon(Icons.microwave),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(25))),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // //ScreenSize
                    // // A Slider
                    // TextFormField(
                    //   controller: screenSizeController,
                    //   keyboardType: TextInputType.number,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'The Screen Size Must Not Be Empty';
                    //     }
                    //   },
                    //   onChanged: (value) =>
                    //       _screenSize.value = double.parse(value),
                    //   decoration: InputDecoration(
                    //       labelText: 'Screen Size',
                    //       hintText: 'The Screen Size',
                    //       suffixIcon: const Icon(Icons.cable),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(25))),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // //Screen Resolution
                    // //
                    // TextFormField(
                    //   controller: screenResolutionController,
                    //   keyboardType: TextInputType.text,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Screen Resolution Must Not Be EMPTY';
                    //     }
                    //   },
                    //   onChanged: (value) => _screenResolution.value = value,
                    //   decoration: InputDecoration(
                    //       labelText: 'Screen Resolution',
                    //       hintText: 'Enter The Screen Resolution',
                    //       suffixIcon: const Icon(Icons.numbers),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(25))),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // //Anti-Glare
                    // //
                    // TextFormField(
                    //   controller: antiGlareController,
                    //   keyboardType: TextInputType.number,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Anti-glare Must Not Be Embty';
                    //     }
                    //   },
                    //   onChanged: (value) => _antiGlare.value = int.parse(value),
                    //   decoration: InputDecoration(
                    //       labelText: 'Anti-Glare',
                    //       hintText: 'Enter The Anti-Glare',
                    //       suffixIcon: const Icon(Icons.cake),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(25))),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // //Touch-Screen
                    // //
                    // TextFormField(
                    //   controller: touchScreenController,
                    //   keyboardType: TextInputType.number,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Touch-Screen Must Not Be Embty';
                    //     }
                    //   },
                    //   onChanged: (value) =>
                    //       _touchScreen.value = int.parse(value),
                    //   decoration: InputDecoration(
                    //       labelText: 'Touch-Screen Identifier',
                    //       hintText: 'Enter The if The screen supports touch',
                    //       suffixIcon: const Icon(Icons.airplay),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(25))),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // //STATE of the laptop
                    // //
                    // TextFormField(
                    //   controller: stateController,
                    //   keyboardType: TextInputType.number,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'The State Must Not Be Embty';
                    //     }
                    //   },
                    //   onChanged: (value) => _state.value = int.parse(value),
                    //   decoration: InputDecoration(
                    //       labelText: 'State',
                    //       hintText: 'Enter THE State',
                    //       suffixIcon: const Icon(Icons.bedroom_baby),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(25))),
                    // ),
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                      child: const Text('Continre'),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          context.flow<PcInfo>().complete((info) =>
                              info.copyWith(
                                  ssd: _ssd.value,
                                  screenRefreshRate: _screenRefreshRate.value,
                                  screenSize: _screenSize.value,
                                  screenResolution: _screenResolution.value,
                                  antiGlare: _antiGlare.value,
                                  touchScreen: _touchScreen.value,
                                  state: _state.value));
                        }
                      },
                    )
                  ],
                ))),
      ),
    ));
  }
}

