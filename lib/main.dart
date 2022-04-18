import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/home/home_cubit.dart';
import 'package:proto/home/home_states.dart';
import "home.dart";
import "screens/screens.dart";
import "./theme.dart";
import 'package:provider/provider.dart';
import "./helpers/cache_helper.dart";

Future<void> main() {
  return BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await CacheHelper.init();
    bool isDarkTheme = CacheHelper.getData(key: 'darkTheme') ?? false;
    CacheHelper.getData(key: "darkTheme");
    runApp(MyApp(
      isDarkTheme: isDarkTheme,
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isDarkTheme}) : super(key: key);
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    //final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocProvider(
        create: (BuildContext context) =>
            HomeCubit()..changeTheme(isDarkTheme: isDarkTheme),
        child: BlocConsumer<HomeCubit, HomeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'ProtoType',
              theme: context.read<HomeCubit>().darkTheme
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
          listener: (BuildContext context, Object? state) {},
        ));
  }
}

