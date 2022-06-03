import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:proto/constants.dart';

import '../home/home_cubit.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    Key? key,
    required this.homeCubit,
  }) : super(key: key);

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 6),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0),
        ),


        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

          backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
            currentIndex: homeCubit.selectedIndex,
            onTap: (index) {
              homeCubit.changeButtomNavIndex(index);
            },
            items: bottomNavigationItems),
      ),
    );
  }
}

//BottomNavigation Elements

var bottomNavigationItems = const <BottomNavigationBarItem>[
  //BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_rounded), label: "QR"),
  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
  BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/p_filled.png'),
    size: 22.0,), label: "Predict"),
  BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/google.png"),size: 24,), label: "Assistant"),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),


];
