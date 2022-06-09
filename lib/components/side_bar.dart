import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/app_bloc/app_bloc.dart';
import 'package:proto/home/home_cubit.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = context.watch<HomeCubit>();
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
                  onTap: () {
                    Navigator.pushNamed(context, "/history");
                  },
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
  }
}

class DrawerDialog extends StatelessWidget {
  const DrawerDialog({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: DrawerDialog());

  @override
  Widget build(BuildContext context) {
    //final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    Future.delayed(Duration.zero, () {
      //showAlertDialog(context);
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
    final HomeCubit homeCubit = context.watch<HomeCubit>();
    return Center(
      child: Container(
        height: 210,
        width: 340,
        margin: const EdgeInsets.fromLTRB(0, 60, 0, 60),
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25.0),
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
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                "Sign in to your account\nOr Create a New Account",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            //const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Theme.of(context).primaryColorDark,
                          Theme.of(context).primaryColorLight,
                        ]),
                    // color: Color(0xff00CBBF),
                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ))),
                      onPressed: () {
                        homeCubit.changeButtomNavIndex(1);
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: const Text(
                        "go to Sign in",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                ),
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),

                    //color: Theme.of(context).backgroundColor,
                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(
                              color: Color(0xff00CBBF),
                            ),
                          ))),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                        //Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff00CBBF),
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
