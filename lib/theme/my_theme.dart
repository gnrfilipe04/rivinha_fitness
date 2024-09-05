import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_colors.dart';

class MyTheme with ChangeNotifier {
  static ThemeData get darkTheme {
    var baseTheme = ThemeData.dark();
    return ThemeData(
      useMaterial3: true,
      splashFactory: NoSplash.splashFactory,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: MyColors.green700,
        foregroundColor: MyColors.gray600,
      ),
      primaryColor: MyColors.green700,
      colorScheme: const ColorScheme(
          primary: MyColors.green700,
          onPrimary: MyColors.green700,
          secondary: MyColors.white,
          onSecondary: MyColors.white,
          brightness: Brightness.dark,
          error: Colors.red,
          onError: Colors.red,
          background: MyColors.gray700,
          onBackground: MyColors.gray700,
          surface: MyColors.gray100,
          onSurface: MyColors.green500),
      splashColor: MyColors.green500,
      cardTheme: CardTheme(
        color: MyColors.gray600,
        surfaceTintColor: Colors.transparent,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: MyColors.gray600,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(color: MyColors.green500, fontFamily: GoogleFonts.poppins().fontFamily),
        contentTextStyle: TextStyle(color: MyColors.green500, fontFamily: GoogleFonts.poppins().fontFamily),
      ),
      appBarTheme: AppBarTheme(
          color: Colors.transparent,
          titleTextStyle:
              TextStyle(color: MyColors.gray100, fontSize: 20, fontFamily: GoogleFonts.poppins().fontFamily),
          toolbarTextStyle: const TextStyle(color: MyColors.green500)),
      scaffoldBackgroundColor: MyColors.gray700,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: MyColors.green500,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(60),
          textStyle: TextStyle(
            fontSize: 18,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          backgroundColor: MyColors.green500,
          foregroundColor: MyColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: MyColors.gray200),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: MyColors.gray500),
        ),
        floatingLabelStyle: const TextStyle(
          color: MyColors.green700,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: MyColors.gray200),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: MyColors.gray200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: MyColors.green700),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
      ),
    );
  }
}
