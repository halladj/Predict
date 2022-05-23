import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/home/home_cubit.dart';
import 'package:proto/home/home_states.dart';
import 'package:proto/app_bloc/app_bloc.dart';

import "home.dart";
import "screens/screens.dart";
import "./theme.dart";
import "./helpers/cache_helper.dart";

import "package:proto/prediction_form/prediction_form.dart";
import 'package:authentication_repository/authentication_repository.dart';
import "package:proto/bloc_observer.dart";
import "package:proto/login/login.dart";

Future<void> main() {
  return BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final authenticationRepository = AuthenticationRepository();
    await authenticationRepository.user.first;
    await CacheHelper.init();
    bool isDarkTheme = CacheHelper.getData(key: 'darkTheme') ?? true;
    CacheHelper.getData(key: "darkTheme");
    runApp(MyApp(
        isDarkTheme: isDarkTheme,
        authenticationRepository: authenticationRepository));
  }, blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.isDarkTheme,
    required AuthenticationRepository authenticationRepository,
    //this Authentication geniric code never mind it
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final bool isDarkTheme;
  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    //final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
          providers: [
            //*this home cubit has all the home bussiness logic:
            //   -darktheme
            //   -bottom navigation
            BlocProvider<HomeCubit>(
                create: (BuildContext context) =>
                    HomeCubit()..changeTheme(isDarkTheme: isDarkTheme)),

            //this Authentication geniric code never mind it
            BlocProvider<AppBloc>(
                create: (_) => AppBloc(
                      authenticationRepository: _authenticationRepository,
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
                  "/login": (context) => const LoginPage(),
                  "/favorites": (context) => const Favorites(),
                },
                debugShowCheckedModeBanner: false,
              );
            },
            listener: (BuildContext context, Object? state) {},
          )),
    );
  }
}
