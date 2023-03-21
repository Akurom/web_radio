
import 'package:flutter/material.dart';
import 'package:web_radio/consts/size_constants.dart';
import 'package:web_radio/utils/utils.dart';
import 'package:web_radio/views/widgets/player.dart';

import 'package:web_radio/views/widgets/radios_list.dart';


class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          // todo app bar
          RadiosList(),
          SizedBox(
            height: screenHeight(context) * SizeConstants.playerRatio,
            child: Player(),
          ),

        ],
      ),
    );
  }
}