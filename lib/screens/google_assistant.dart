import 'package:flutter/material.dart';

class GoogleAssistant extends StatelessWidget {
  const GoogleAssistant({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: GoogleAssistant());

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200, height: 120, child: Text("UR Now Authenticated"));
  }
}
