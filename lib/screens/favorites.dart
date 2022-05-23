import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/home/home_cubit.dart';
import 'package:proto/login/login.dart';
import "package:flow_builder/flow_builder.dart";
import "package:proto/app_bloc/app_bloc.dart";
import "package:proto/home.dart";

import 'google_assistant.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: (AppStatus state, List<Page<dynamic>> pages) {
          switch (state) {
            case AppStatus.authenticated:
              return [GoogleAssistant.page()];
            case AppStatus.unauthenticated:
              //homeCubit.changeButtomNavIndex(3);
              return [MyDialog.page()];
          }
        },
      ),
    );
  }
}

class MyDialog extends StatelessWidget {
  const MyDialog({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: MyDialog());

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    Future.delayed(Duration.zero, () {
      showAlertDialog(context);
    });
    homeCubit.changeButtomNavIndex(3);
    return const LoginPage();
  }
}

showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Auth"),
        content: const Text(
            "This action requires Authentication\nplease login to check your Favorites"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          )
        ],
      );
    },
  );
}
