import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/app_bloc/app_bloc.dart';
import 'package:proto/home/home_cubit.dart';
import 'package:proto/login/cubit/login_cubit.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.watch<HomeCubit>();
    return BlocProvider(
      create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
      child: BlocConsumer<AppBloc, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            var authState = context.select((AppBloc bloc) => bloc.state.status);
            var user = context.select((AppBloc bloc) => bloc.state.user);
            return authState == AppStatus.unauthenticated
                ? const DrawerDialog()
                : Drawer(
                    child: ListView(
                      children: [
                        UserAccountsDrawerHeader(
                          accountName: Text(user.name ?? "userName"),
                          accountEmail: Text(user.email ?? "userEmail"),
                          currentAccountPicture: CircleAvatar(
                            child: Image.asset(
                              'assets/laptop1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          // decoration: BoxDecoration(
                          //   color: Colors.teal,
                          // ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.favorite),
                          title: const Text("Favorites"),
                          onTap: () {
                            homeCubit.changeButtomNavIndex(1);
                            Scaffold.of(context).openEndDrawer();
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.history),
                          title: const Text("History"),
                          onTap: () {},
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text("Settings"),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.description),
                          title: const Text("Policies"),
                          onTap: () {},
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.exit_to_app),
                          title: const Text("Exit"),
                          onTap: () async {
                            //TODO create a logout diaglog
                            Scaffold.of(context).openEndDrawer();
                            homeCubit.changeButtomNavIndex(2);
                            sleep(Duration.zero);
                            context.read<AppBloc>().add(AppLogoutRequested());
                          },
                        ),
                      ],
                    ),
                  );
          }),
    );
  }
}

class DrawerDialog extends StatelessWidget {
  const DrawerDialog({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: DrawerDialog());

  @override
  Widget build(BuildContext context) {
    //final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    Future.delayed(Duration.zero, () {
      showAlertDialog(context);
    });
    //homeCubit.changeButtomNavIndex(4);
    //return const LoginPage();
    return const PageOne();
  }
}

showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Auth"),
        content: const Text(
            "This action requires Authentication\nplease login to check your Account"),
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

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: PageOne());

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return Center(
      child: Container(
        height: 400,
        margin: const EdgeInsets.fromLTRB(0, 60, 0, 60),
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 35.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Theme.of(context).backgroundColor,
          //color: HexColor("#ebf3fb"),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                "You Need to Sign In! ",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                "Sign in to your account\nOr Create a New Account",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                child: const Text("go to signin"),
                onPressed: () {
                  homeCubit.changeButtomNavIndex(4);
                  Scaffold.of(context).openEndDrawer();
                }),
            ElevatedButton(
                child: const Text("cancel"),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                  //Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
