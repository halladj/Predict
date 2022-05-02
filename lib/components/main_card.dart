import "package:flutter/material.dart";
import 'package:proto/components/components.dart';

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  final String title = "Predict using a form";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: [
            Positioned(
              child: Text(title, style: Theme.of(context).textTheme.headline4),
              top: 20,
              left: 20,
            ),
            Positioned(
              child: ElevatedButton(
                  onPressed: () {},
                  //onPressed: () {
                  //  Navigator.pushNamed(context, '/predition_form');
                  //},
                  child: const Text(
                    "Predition Form",
                  )),
              bottom: 0,
              width: 380,
            )
          ],
        ),
        //padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 380,
          height: 250,
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

