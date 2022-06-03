import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:proto/constants.dart';

class CustomColors {
  static final Color buttonColor = HexColor("#726eff");
  static final Color buttonHighlightColor = HexColor("#393780");
  //static final Color upperGradientColor = HexColor("#D665E0");
  //static final Color lowerGradientColor = HexColor("#945FED");
  static final Color upperGradientColor = HexColor("#C9C9C9");
  static final Color lowerGradientColor = HexColor("#ffffff");
}

class CustomTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: Colors.blueGrey,
    ),
   bodyText2: TextStyle(
     fontSize: 17,
     fontWeight: FontWeight.normal,
     color: Colors.blueGrey,
   ),

    headline1: GoogleFonts.openSans(
        fontSize: 29,
        fontWeight: FontWeight.w700,
        color: Color(0xff06446C),

    ),
    headline2: TextStyle(
      fontSize: 28,
        fontWeight: FontWeight.w400,
        color: Colors.blueGrey,

    ),
    headline3: TextStyle(fontSize: 38,
      fontWeight: FontWeight.w500,color: Color(0xff06446C),
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(

    bodyText1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),

    headline1: GoogleFonts.openSans(
      fontSize: 29.0,
      fontWeight: FontWeight.w700,
      color: Color(0xff66fcf1),
    ),
    headline2: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: Colors.white.withOpacity(0.8),

    ),
    headline3: TextStyle(fontSize: 38,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),

    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: coolPurple[800],
    ),
  );

  static ThemeData light() {
    String logo='assets/logo_3.png';
    return ThemeData(

      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      scaffoldBackgroundColor: kLightBackgroundColor,
      backgroundColor: Colors.white,
      primaryColorDark: Color(0xffd8a1f9),
      primaryColorLight: Color(0xff57ebdf),
      //Some Global Stuff
      primaryColor: HexColor("#726eff"),
      primarySwatch: Colors.purple,
      //AppBar Styles
      //
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Color(0xffdb4dff),),
          //actionsIconTheme: ,
          elevation: 0,
          foregroundColor: Colors.black,
          //backgroundColor: Colors.white.withOpacity(0.5),
          backgroundColor: Colors.transparent,
          titleTextStyle: lightTextTheme.headline6,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light)),
      //flaotingActiomBotton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      //BottomNav Styles
      //
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor("#FDFFFF"),
        selectedItemColor: HexColor("#D0A0F7"),
        unselectedItemColor: Colors.grey[350],
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    String logo='assets/logo_dark.png';
    //#726eff purple
    //#5affe7
    //#obc6ab
    //#37465b
    //#212b3b
    return ThemeData(
        brightness: Brightness.dark,
        //flaotingActiomBotton
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: HexColor("#726eff"),
        ),
        //BottomNav Styles
        //
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xff1C2C60),
            //unselectedItemColor: HexColor('#0BC6AB'),
            unselectedItemColor: Color(0xff4D6270),
            //selectedItemColor: HexColor('#5affe7')
            selectedItemColor: Color(0xff66fcf1),),
        //TextTheme
        textTheme: darkTextTheme,
        //Some Global Stuff
        scaffoldBackgroundColor: kDarkgroundColor,
        backgroundColor: Color(0xff1C2C60),
        shadowColor: Colors.transparent,
        primarySwatch: ourPurple,
        primaryColorDark: Color(0xffda3eb4),
        primaryColorLight: Color(0xff66fcf1),
        //AppBar Styles
        //
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Color(0xff66fcf1),),
            elevation: 0,
            backgroundColor: Colors.transparent,
            titleTextStyle: lightTextTheme.headline6,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark)),



        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(HexColor("#726eff")),
                foregroundColor:
                    MaterialStateProperty.all<Color>(HexColor("#5affe7")),
                elevation: MaterialStateProperty.all(20.0))));
  }
}

final Map<int, Color> coolPurple = {
  50: HexColor("#726eff"),
  100: HexColor("#726eff"),
  200: HexColor("#726eff"),
  300: HexColor("#726eff"),
  400: HexColor("#726eff"),
  500: HexColor("#726eff"),
  600: HexColor("#726eff"),
  700: HexColor("#726eff"),
  800: HexColor("#726eff"),
  900: HexColor("#726eff"),
};

final MaterialColor ourPurple = MaterialColor(50, coolPurple);
