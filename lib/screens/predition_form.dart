import "package:flutter/material.dart";
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:proto/components/components.dart';

class PreditionForm extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var gpuController = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();

  PreditionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appBar: AppBar(),
          titleText: "Predidiction Form",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 80, bottom: 60, left: 20, right: 20),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Prediction',
                    style: TextStyle(fontSize: 35.0),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'CPU Must Not Be Embty';
                      }
                    },
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.abc),
                        border: OutlineInputBorder(),
                        label: Text('CPU')),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'GPU Must Not Be Embty';
                      }
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                        label: Text('GPU')),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ScreenSize Must Not Be Embty';
                      }
                    },
                    controller: gpuController,
                    onFieldSubmitted: (value) {
                      if (formkey.currentState!.validate()) {}
                    },
                    keyboardType: TextInputType.visiblePassword,
                    //obscureText: Cupit.get(context).ishidden,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.password), onPressed: () {}),
                        prefixIcon: const Icon(Icons.password_outlined),
                        border: const OutlineInputBorder(),
                        label: const Text('ScreenSize')),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const Text('Forgot Password?'),
                      const Spacer(),
                      FloatingActionButton(
                        onPressed: () {
                          //if (formkey.currentState!.validate()) {
                          Navigator.pushNamed(context, "/predition");
                          //}
                        },
                        child: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

