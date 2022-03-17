import 'package:flutter/material.dart';
import "home.dart";
import "screens/screens.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProtoType',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.black),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(primary: Colors.black)),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: Colors.black)),
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const Home(),
        "/hub": (context) => const Hub(),
        '/predition_form': (context) => PreditionForm(),
        '/profile_user': (context) => const ProfileUser(),
        "/predition": (context) => const Predition(),
        "/signin": (context) =>
            Signin(), //it replaces the profile_non_user route
        "/signup": (context) => Signup(),
        "/generatedQR": (context) => const GeneratedQR(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

