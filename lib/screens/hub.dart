import "package:flutter/material.dart";
import "../components/components.dart";

class Hub extends StatelessWidget {
  const Hub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MainCard(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/predition_form');
                },
                child: const Text("Predition Form"))
          ],
        ),
      ),
    );
  }
}

