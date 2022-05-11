import "package:flutter/material.dart";
import 'package:proto/home/home_cubit.dart';
import 'package:proto/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proto/screens/favorites.dart';

class Home extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: Home());
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    //WE USED THE BLOC BUILDER HERE TO ALLOW
    // RERENDER in the widget
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, cubit) {
      return Scaffold(
        body: homeCubit.pages[homeCubit.selectedIndex],
        //BOTTOM NAVIGATION STYLING
        bottomNavigationBar: Container(
          height: 68,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 6),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
                elevation: 0.0,
                currentIndex: homeCubit.selectedIndex,
                onTap: (index) {
                  homeCubit.changeButtomNavIndex(index);
                },
                items: bottomNavigationItems),
          ),
        ),
      );
    });
  }
}

//BottomNavigation Elements

var bottomNavigationItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: Icon(Icons.qr_code_scanner_rounded), label: "QR"),
  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
  BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Hub"),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  BottomNavigationBarItem(
      icon: ImageIcon(AssetImage("assets/google.png")),
      label: "Google Assistant"),
];
