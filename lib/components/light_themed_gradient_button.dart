import 'package:flutter/material.dart';
class LightThemedGradientButton extends StatelessWidget {
  final String pushedScreen;
  const LightThemedGradientButton({
    Key? key,required this.pushedScreen
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30))),
      onPressed: () {
        Navigator.pushNamed(context, pushedScreen);
      },
      child: Ink(
        padding:
        const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xff4589D7), Color(0xffD0A0F7)]),
            borderRadius: BorderRadius.circular(20)),
        child: const Text(
          "Predict Now!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}