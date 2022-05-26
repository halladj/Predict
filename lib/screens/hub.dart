import 'package:flutter/material.dart';
class Hub extends StatelessWidget {
  const Hub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(

            children: [
              Card(
                child: Text('lol'),
              ),
              Card(
                child: Text('lol'),
              ),
              Card(
                child: Text('lol'),
              ),
            ],
          ),
        ),
      ],

    );
  }
}
