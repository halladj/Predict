import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import "package:proto/theme.dart";

class CustomSlider extends StatelessWidget {
  CustomSlider(
      {Key? key,
      required this.value,
      required this.label,
      required this.seconedLabel,
      required this.max,
      required this.min,
      required this.divisions})
      : super(key: key);

  var value;
  String label;
  String seconedLabel;
  double max;
  double min;
  int divisions;

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              label,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: Colors.blueGrey.withOpacity(0.8),),
            ),
            const SizedBox(width: 16.0),
            SizedBox(
              width: 160,
              child: Slider(
                value: value.value.toDouble(),
                onChanged: (value2) => value.value = value2.toInt(),
                inactiveColor: CustomColors.buttonColor,
                activeColor: CustomColors.buttonHighlightColor,
                max: max,
                min: min,
                divisions: divisions,
                label: value.value.toString(),
              ),
            ),
          ],
        ),
        Text(
          seconedLabel,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff06446C).withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
