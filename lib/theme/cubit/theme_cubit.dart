import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_radio/consts/color_constants.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_defaultTheme);

  // todo load from local storage
  static final _defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(color: Colors.blue),
    brightness: Brightness.light,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(fontSize: 92.0, color: ColorConstants.primaryColor),
      displayMedium: GoogleFonts.roboto(fontSize: 44.0, color: ColorConstants.primaryColor),
      displaySmall: GoogleFonts.roboto(fontSize: 24.0, color: ColorConstants.primaryColor),
      headlineLarge: GoogleFonts.roboto(color: ColorConstants.primaryColor),
      headlineMedium: GoogleFonts.roboto(color: ColorConstants.primaryColor),
      headlineSmall: GoogleFonts.roboto(color: ColorConstants.primaryColor),
      bodyLarge: GoogleFonts.roboto(fontSize: 16.0, color: ColorConstants.primaryColor),
      bodySmall: GoogleFonts.roboto(color: ColorConstants.primaryColor),
      labelLarge: GoogleFonts.roboto(color: ColorConstants.primaryColor),
      labelMedium: GoogleFonts.roboto(color: ColorConstants.primaryColor),
      labelSmall: GoogleFonts.roboto(color: ColorConstants.primaryColor),
    ),
  );

  void changeTheme(MaterialColor themeColor, Brightness themeBrightness) {

    final customTheme = _defaultTheme.copyWith(
      //primarySwatch: themeColor,
      primaryColor: themeColor,
      appBarTheme: AppBarTheme(color: themeColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: themeColor,
      ),
      brightness: themeBrightness,
    );

    /*final colorTheme = ThemeData(
      primarySwatch: themeColor,
      primaryColor: themeColor,
      appBarTheme: AppBarTheme(color: themeColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: themeColor,
      ),
      brightness: themeBrightness,
    );*/
    emit(customTheme);
  }
}
