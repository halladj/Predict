import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import "package:proto/theme.dart";

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.label,
      required this.hint,
      required this.controller,
      required this.onChanged,
      required this.keyboardInputType,
      required this.autoFocus})
      : super(key: key);

  String label;
  String hint;
  var controller;
  bool autoFocus = false;
  Function(String)? onChanged;
  TextInputType keyboardInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 2.0),
            child: Text(label,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blueGrey.withOpacity(0.8),),),),
        TextFormField(
          autofocus: autoFocus,
          controller: controller,
          keyboardType: keyboardInputType,
          validator: (value) {
            if (value!.isEmpty) {
              return '${label} Field Must Not Be Empty';
            }
          },
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 16, color: HexColor("#b4b8bc")),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xff35e0d2), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
