import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:web_radio/blocs/player/player_bloc.dart';
import 'package:web_radio/blocs/radios/radios_bloc.dart';
import 'package:web_radio/views/pages/home_page.dart';
import 'repositories/repositories.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
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

          // TODO

          ),
      home: const HomePage(),
    );
  }
}
