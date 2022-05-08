import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/home/home_cubit.dart';
import 'package:proto/home/home_states.dart';

import "home.dart";
import "screens/screens.dart";
import "./theme.dart";
import "./helpers/cache_helper.dart";

import "package:proto/prediction_form/prediction_form.dart";
import 'package:authentication_repository/authentication_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'package:proto/authentication/authentication.dart';

import "package:proto/login/login.dart";

Future<void> main() {
  return BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await CacheHelper.init();
    bool isDarkTheme = CacheHelper.getData(key: 'darkTheme') ?? false;
    CacheHelper.getData(key: "darkTheme");
    runApp(MyApp(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
      isDarkTheme: isDarkTheme,
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.isDarkTheme,
    //this Authentication geniric code never mind it
    required this.authenticationRepository,
    required this.userRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    //final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return MultiBlocProvider(
        providers: [
          //*this home cubit has all the home bussiness logic:
          //   -darktheme
          //   -bottom navigation
          BlocProvider<HomeCubit>(
              create: (BuildContext context) =>
                  HomeCubit()..changeTheme(isDarkTheme: isDarkTheme)),

          //this Authentication geniric code never mind it
          BlocProvider<AuthenticationBloc>(
              create: (_) => AuthenticationBloc(
                    authenticationRepository: authenticationRepository,
                    userRepository: userRepository,
                  )),
        ],
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
                '/predition_form': (context) => const PredictionForm(),
                "/predition": (context) => const Prediction(),
                "/google": (context) => const GoogleAssistant(),
                "/generatedQR": (context) => const GeneratedQR(),
                "/login": (context) => LoginPage(),
              },
              debugShowCheckedModeBanner: false,
            );
          },
          listener: (BuildContext context, Object? state) {},
        ));
  }
}
