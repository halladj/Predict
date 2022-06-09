import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/home/home_cubit.dart';
import 'package:proto/login/view/login_page.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: MyDialog());

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    Future.delayed(Duration.zero, () {
      showAlertDialog(context);
    });
    homeCubit.changeButtomNavIndex(4);
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
