
import 'package:flutter/material.dart';
import 'package:web_radio/consts/size_constants.dart';
import 'package:web_radio/utils/utils.dart';
import 'package:web_radio/views/widgets/custom_app_bar.dart';
import 'package:web_radio/views/widgets/player.dart';

import 'package:web_radio/views/widgets/radios_list.dart';


class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: /*SafeArea(child: */Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          CustomAppBar(),
          RadiosList(),
          SizedBox(
            height: screenHeight(context) * SizeConstants.playerRatio,
            child: Player(),
          ),

        ],
      ),
   /* ),*/);
  }
}