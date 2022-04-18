import "package:flutter/material.dart";
import 'package:proto/home/home_cubit.dart';
import 'package:proto/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, cubit) {
      return Scaffold(
        appBar: AppBar(
          //elevation: 10.0,
          leading: const Icon(Icons.logo_dev),
          title: const Text("ProtoType"),
          actions: [
            IconButton(
              icon: const Icon(Icons.sunny),
              onPressed: () {
                homeCubit.changeTheme();
              },
            )
          ],
        ),
        body: homeCubit.pages[homeCubit.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            //selectedItemColor: Colors.black,
            currentIndex: homeCubit.selectedIndex,
            onTap: (index) {
              homeCubit.changeButtomNavIndex(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_scanner_rounded), label: "QR"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Hub"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded), label: "Google Assistant"),
            ]),
      );
    });
  }
}

