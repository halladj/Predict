import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_hex_color/flutter_hex_color.dart';

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
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: coolPurple[800],
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: coolPurple[800],
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: coolPurple[800],
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: coolPurple[800],
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: coolPurple[800],
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      scaffoldBackgroundColor: HexColor("#fdffff"),
      //Some Global Stuff
      primaryColor: HexColor("#726eff"),
      primarySwatch: Colors.purple,
      //AppBar Styles
      //
      appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.black),
          //actionsIconTheme: ,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
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
        unselectedItemColor: HexColor("#C4C4C4"),
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    //#726eff purple
    //#5affe7
    //#obc6ab
    //#37465b
    //#212b3b
    return ThemeData(
        //brightness: Brightness.dark,
        //flaotingActiomBotton
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: HexColor("#726eff"),
        ),
        //BottomNav Styles
        //
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: HexColor('#37465b'),
            //unselectedItemColor: HexColor('#0BC6AB'),
            unselectedItemColor: HexColor('#5B58CC'),
            //selectedItemColor: HexColor('#5affe7')
            selectedItemColor: coolPurple[700]),
        //TextTheme
        textTheme: const TextTheme(
            headline4: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
            bodyText2: TextStyle(
              color: Color(0xffb3b2b2),
            ),
            headline6: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18)),
        //Some Global Stuff
        scaffoldBackgroundColor: HexColor("#212b3b"),
        primarySwatch: ourPurple,
        //AppBar Styles
        //
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: coolPurple[50]),
            elevation: 10,
            backgroundColor: HexColor('#37465b'),
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
