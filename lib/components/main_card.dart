import "package:flutter/material.dart";
import 'package:proto/components/components.dart';

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  final String category = "PC prices Accurate predictions";
  final String title = "Predict";
  final String description = "And Many Other Features";
  final String chef = "SCI L3 Graguation Project";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: [
            Text(category,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            Positioned(
                child: Text(title,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                top: 20),
            Positioned(
                child: Text(description,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                bottom: 30,
                right: 0),
            Positioned(
              child: Text(chef,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              bottom: 10,
              right: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 380,
          height: 520,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/office.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

