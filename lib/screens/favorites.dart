import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/authentication/authentication.dart';
import 'package:proto/splash/splash.dart';
import "package:proto/screens/screens.dart";

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                Navigator.pushNamed(context, '/hub');
                //_navigator.pushAndRemoveUntil<void>(
                //  HomePage.route(),
                //  (route) => false,
                //);
                break;
              case AuthenticationStatus.unauthenticated:
                Navigator.pushNamed(context, '/login');
                //_navigator.pushAndRemoveUntil<void>(
                //  LoginPage.route(),
                //  (route) => false,
                //);
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
