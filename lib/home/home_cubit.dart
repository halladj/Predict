import "package:flutter/material.dart";
import "package:bloc/bloc.dart";
import "package:proto/home/home_states.dart";
import "package:proto/screens/screens.dart";

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());

  bool darkTheme = true;
  void changeTheme() {
    darkTheme = !darkTheme;
    emit(DarkModeState());
  }

  //the list of the bottom vaigation pages
  List<Widget> pages = <Widget>[
    const QRCodeScanner(),
    const Hub(),
    const GoogleAssistant(),
  ];
  int selectedIndex = 0;
  void changeButtomNavIndex(int index) {
    selectedIndex = index;
    emit(ChangeButtomNavIndexState());
  }
}

