import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/home/home_cubit.dart';
import "home.dart";
import "screens/screens.dart";
import "./theme.dart";
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context);
    return BlocProvider(
        create: (BuildContext context) => HomeCubit(),
        child: Consumer<HomeCubit>(
          builder: (_, homeCubit, __) {
            return MaterialApp(
              title: 'ProtoType',
              theme: homeCubit.darkTheme
                  ? CustomTheme.light()
                  : CustomTheme.dark(),
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
          },
        ));
  }
}

