
import 'package:flutter/material.dart';

import 'package:web_radio/views/widgets/radios_list.dart';


class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // todo app bar
        children: [
          RadiosList(),
        ],
      ),
    );
  }
}