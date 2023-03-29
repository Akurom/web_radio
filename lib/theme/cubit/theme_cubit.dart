import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_radio/consts/color_constants.dart';


class ThemeCubit extends Cubit<ThemeData> {

  final ThemeData defaultTheme;

  ThemeCubit({required this.defaultTheme}) : super(defaultTheme);


  void changeTheme(MaterialColor themeColor, Brightness themeBrightness) async {

    print('changeTHeme');

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('themeColorValue', themeColor.value);

    final String? themeLabel = prefs.getString('themeLabel');
    final int? themeColorValue = prefs.getInt('themeColorValue');
    print (themeColor.value);


    final customTheme = defaultTheme.copyWith(
      //primarySwatch: themeColor,
      primaryColor: themeColor,//Color(themeColorValue ?? themeColor.value),//themeColor,
      appBarTheme: AppBarTheme(color: themeColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: themeColor,
      ),
      brightness: themeBrightness,
    );

    emit(customTheme);
  }
}
