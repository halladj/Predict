import 'package:flutter/material.dart';
import "package:proto/theme.dart";



class CustomSlider extends StatelessWidget {
  CustomSlider({
    Key? key,
    required this.value,
    required this.label,
    required this.seconedLabel,
    required this.max,
    required this.min,
    required this.divisions
  }) : super(key: key);

  var value;
  String label;
  String seconedLabel;
  double max;
  double min;
  int divisions;


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: CustomColors.buttonColor,
            ),
          ),
          const SizedBox(width: 16.0),
          Text(
            seconedLabel,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColors.buttonHighlightColor,
            ),
          ),
        ],
      ),
      Slider(
        value: value.value.toDouble(),
        onChanged:(value2) => value.value= value2.toInt() ,
        inactiveColor: CustomColors.buttonColor,
        activeColor: CustomColors.buttonHighlightColor,
        max: max,
        min: min,
        divisions: divisions,
        label: value.value.toString(),
      ),
    ],);
  }
}

