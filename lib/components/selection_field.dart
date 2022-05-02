import 'package:flutter/material.dart';
import "package:proto/theme.dart";
import 'package:flutter_hooks/flutter_hooks.dart';


class SelectionField extends HookWidget {
  SelectionField({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  String label;
  var value;

  @override
  Widget build(BuildContext context) {
    final _state= useState<String?>("used");

    // return Column(
    //   children: [
    //     ChoiceChip(
    //       label: Text('item index'),
    //       selected: _state.value == "new",
    //       onSelected: (bool selected) {
    //         _state.value = selected ? "new": null;
    //       },
    //     ),
    //     ChoiceChip(
    //       label: Text('item index'),
    //       selected: _state.value == "used",
    //       onSelected: (bool selected) {
    //         _state.value = selected ? "used": null;
    //       },
    //     ),
    //   ],
    // );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
            color: CustomColors.buttonColor,
          ),
        ),
        Wrap(
          spacing: 10.0,
          children: [
            ChoiceChip(
              selectedColor: CustomColors.buttonHighlightColor,
              selected: _state.value == "used",
              label: const Text("Used", style: TextStyle(color: Colors.white)),
              onSelected: (selected)  {
                _state.value = selected ? "used": null;
                value.value= "used";
              },
            ),
            ChoiceChip(
              selectedColor: CustomColors.buttonHighlightColor,
              selected: _state.value == "new",
              label:
              const Text("New", style: TextStyle(color: Colors.white)),
              onSelected: (bool selected) {
                _state.value = selected ? "new": null;
                value.value= "new";
              },
            ),

          ],
        ),
      ],
    );
  }
}
