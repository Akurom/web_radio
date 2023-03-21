import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_radio/blocs/radios/radios_bloc.dart';
import 'package:web_radio/views/pages/home_page.dart';
import 'repositories/repositories.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final RadiosRepository radiosRepository = RadiosRepository();

  runApp(
    BlocProvider(
      create: (context) => RadiosBloc(
        radiosRepository: radiosRepository,
        countryCode: 'jp',
      )..add(GetRadios()),
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
