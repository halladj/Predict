import 'package:flutter/material.dart';
import "package:proto/theme.dart";


class CustomTextField extends StatelessWidget {
   CustomTextField({
    Key? key,
     required this.label,
     required this.icon,
     required this.controller,
     required this.onChanged,
     required this.keyboardInputType,
     required this.autoFocus}) : super(key: key);

  String label;
  var controller;
  bool autoFocus= false;
  IconData icon;
  Function(String)? onChanged;
  TextInputType keyboardInputType;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      controller: controller,
      keyboardType: keyboardInputType,
      validator: (value) {
        if (value!.isEmpty) {
          return '${label} Field Must Not Be Embty';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 16.0, color: CustomColors.buttonColor),
        prefixIcon: Icon(icon, color: CustomColors.buttonColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColors.buttonColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: CustomColors.buttonColor),
        ),
      ),
    );
  }
}
