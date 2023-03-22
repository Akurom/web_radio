import 'dart:io';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:web_radio/blocs/player/player_bloc.dart';
import 'package:web_radio/blocs/radios/radios_bloc.dart';
import 'package:web_radio/consts/color_constants.dart';
import 'package:web_radio/views/pages/home_page.dart';
import 'repositories/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  final RadiosRepository radiosRepository = RadiosRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<RadiosBloc>(
          create: (BuildContext context) => RadiosBloc(
            radiosRepository: radiosRepository,
            countryCode: 'jp',
          )..add(GetRadios()),
        ),
        BlocProvider<PlayerBloc>(
          create: (BuildContext context) => PlayerBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
      ),
      home: const HomePage(),
    );
  }
}
