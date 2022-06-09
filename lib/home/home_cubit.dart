import "package:flutter/material.dart";
import "package:bloc/bloc.dart";
import 'package:proto/favorite/favorites.dart';
import "package:proto/home/home_states.dart";
import 'package:proto/prediction_form/prediction_form.dart';
import "package:proto/screens/screens.dart";
import "package:proto/helpers/cache_helper.dart";

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());

  bool darkTheme = true;
  bool icon = true;
  bool condition = false;
  bool qrCondition = false;
  bool favoriteCondition = false;

  void changePredictionFormCondition({required bool value}) {
    condition = value;
    emit(ChangeFavoriteCondition());
  }

  void changeQrCodeCondition({required bool value}) {
    qrCondition = value;
    emit(ChangePredictionFormCondition());
  }

  void changeFavoriteCondition({required bool value}) {
    favoriteCondition = value;
    emit(ChangePredictionFormCondition());
  }
  // void changeIcon(){
  //   icon =!icon;
  //
  //   emit(ChangeIconState());
  // }
  //

  void changeTheme({isDarkTheme}) {
    if (isDarkTheme != null) {
      darkTheme = isDarkTheme;
    } else {
      darkTheme = !darkTheme;
    }
    CacheHelper.insertData(key: 'darkTheme', value: darkTheme).then((value) {
      emit(DarkModeState());
    });
  }

  //the list of the bottom vaigation pages
  List<Widget> pages = <Widget>[
    //const Hub(),
    const QRCodeScanner(),
    const Favorites(),
    PredictionForm(),
    const GoogleAssistant(),
    //const Profile(),
  ];
  int selectedIndex = 2;
  void changeButtomNavIndex(int index) {
    selectedIndex = index;
    emit(ChangeButtomNavIndexState());
  }
}
