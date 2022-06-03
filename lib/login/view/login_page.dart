import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/components/appbar.dart';
import 'package:proto/components/secondary_app_bar.dart';
import 'package:proto/home/home_cubit.dart';
import 'package:proto/home/home_states.dart';
import 'package:proto/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      //homeCubit.changeButtomNavIndex(3);
      //TODO CREATE A REDDIREDCT TO THE PROFILE PAGE WHEN
      //THE STATE IS UN AUTHERIZED<< implemented in the favorities page>>
      return
       Padding(
          padding: const EdgeInsets.all(8),
          child: BlocProvider(
            create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
            child: const LoginForm(),
          ),
        );
    });
  }
}
