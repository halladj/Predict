import "package:flutter/material.dart";
import "package:proto/components/components.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/home/home_cubit.dart';

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

