import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_radio/consts/color_constants.dart';


class ThemeCubit extends Cubit<ThemeData> {

  final ThemeData defaultTheme;

  ThemeCubit({required this.defaultTheme}) : super(defaultTheme);


  void changeTheme(MaterialColor themeColor, Brightness themeBrightness) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('themeColorValue', themeColor.value);

    final int? themeColorValue = prefs.getInt('themeColorValue');

    final customTheme = defaultTheme.copyWith(
      colorScheme: ColorScheme.fromSwatch(
        accentColor: themeColor,
      ),
      primaryColor: themeColor,
      appBarTheme: AppBarTheme(color: themeColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: themeColor,
      ),
      brightness: themeBrightness,
    );

    emit(customTheme);
  }
}
