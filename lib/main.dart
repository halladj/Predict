import 'package:flutter/material.dart';
import "home.dart";
import "screens/screens.dart";
import "./theme.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProtoType',
      theme: CustomTheme.dark(),
      initialRoute: "/",
      routes: {
        '/': (context) => const Home(),
        "/hub": (context) => const Hub(),
        '/predition_form': (context) => PreditionForm(),
        "/predition": (context) => const Predition(),
        "/google": (context) => const GoogleAssistant(),
        "/generatedQR": (context) => const GeneratedQR(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

