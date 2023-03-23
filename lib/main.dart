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
import 'package:web_radio/theme/cubit/theme_cubit.dart';
import 'package:web_radio/views/pages/home_page.dart';
import 'repositories/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final RadiosRepository radiosRepository = RadiosRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider<RadiosBloc>(
          create: (_) => RadiosBloc(
            radiosRepository: radiosRepository,
            countryCode: 'jp',
          )..add(GetRadios()),
        ),
        BlocProvider<PlayerBloc>(
          create: (_) => PlayerBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (_, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const HomePage(),
        );
      },
    );
  }
}
