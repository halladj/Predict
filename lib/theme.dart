import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_hex_color/flutter_hex_color.dart';

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
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
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
      primaryColor: HexColor("#726eff"),
      primarySwatch: Colors.purple,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
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
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: HexColor("#726eff"),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: HexColor('#37465b'),
            unselectedItemColor: HexColor('#0BC6AB'),
            selectedItemColor: HexColor('#5affe7')),
        textTheme: const TextTheme(
            headline4: TextStyle(
                color: Color(0xffb3b2b2), fontWeight: FontWeight.w500),
            bodyText2: TextStyle(
              color: Color(0xffb3b2b2),
            ),
            headline6: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18)),
        scaffoldBackgroundColor: HexColor("#212b3b"),
        primarySwatch: ourPurple,
        appBarTheme: AppBarTheme(
          elevation: 10,
          backgroundColor: HexColor('#37465b'),
        ),
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

