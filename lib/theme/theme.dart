import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_radio/consts/color_constants.dart';



MaterialColor? colorValueToMaterialColor(int? sourceColorValue) {
  if (sourceColorValue == null)  return null;

  Map<int, Color> color =
  {
    50: Color(sourceColorValue).withOpacity(.1),
    100: Color(sourceColorValue).withOpacity(.2),
    200: Color(sourceColorValue).withOpacity(.3),
    300: Color(sourceColorValue).withOpacity(.4),
    400: Color(sourceColorValue).withOpacity(.5),
    500: Color(sourceColorValue).withOpacity(.6),
    600: Color(sourceColorValue).withOpacity(.7),
    700: Color(sourceColorValue).withOpacity(.8),
    800: Color(sourceColorValue).withOpacity(.9),
    900: Color(sourceColorValue).withOpacity(1),
  };
  MaterialColor colorCustom = MaterialColor(sourceColorValue, color);
  return colorCustom;
}


Future<ThemeData> loadThemeFromPreference() async {

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final bool? isDark = prefs.getBool('isDark');
  final int? themeColorValue = prefs.getInt('themeColorValue');

  MaterialColor? prefsColor = colorValueToMaterialColor(themeColorValue);

  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      accentColor: prefsColor ?? ColorConstants.defaultColor,
    ),
    primarySwatch: prefsColor ?? ColorConstants.defaultColor,
    appBarTheme: AppBarTheme(color: prefsColor ?? ColorConstants.defaultColor),
    brightness: Brightness.light,
    textTheme: TextTheme(
      displaySmall: GoogleFonts.roboto(color: ColorConstants.primaryColor),
      headlineLarge: GoogleFonts.roboto(color: ColorConstants.primaryColor),
      headlineMedium: GoogleFonts.roboto(color: ColorConstants.primaryColor),
      headlineSmall: GoogleFonts.roboto(color: ColorConstants.primaryColor),
      bodyLarge: GoogleFonts.roboto(fontSize: 16.0, color: ColorConstants.primaryColor),
      bodySmall: GoogleFonts.roboto(color: ColorConstants.primaryColor),
    ),
  );
}