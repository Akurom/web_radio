import 'package:flutter/material.dart';
import 'repositories/repositories.dart';

void main() {

  // ------ TESTS
  RadioRepository().getRadiosByCountryCode('jp');


  //-----------------


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Container()
    );
  }
}
