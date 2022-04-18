import "package:flutter/material.dart";
import "package:bloc/bloc.dart";
import "package:proto/home/home_states.dart";
import "package:proto/screens/screens.dart";
import "package:proto/helpers/cache_helper.dart";

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());

  bool darkTheme = true;
  void changeTheme({isDarkTheme}) {
    if (isDarkTheme != null) {
      darkTheme = isDarkTheme;
    } else {
      darkTheme = !darkTheme;
    }
    CacheHelper.insertData(key: 'darkTheme', value: darkTheme).then((value) {
      emit(DarkModeState());
    });
    print(CacheHelper.getData(key: "darkTheme"));
  }

  //the list of the bottom vaigation pages
  List<Widget> pages = <Widget>[
    const QRCodeScanner(),
    const Hub(),
    const GoogleAssistant(),
  ];
  int selectedIndex = 1;
  void changeButtomNavIndex(int index) {
    selectedIndex = index;
    emit(ChangeButtomNavIndexState());
  }
}

