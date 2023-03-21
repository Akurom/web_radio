import 'package:flutter/material.dart';
import 'package:web_radio/consts/color_constants.dart';
import 'package:web_radio/consts/size_constants.dart';
import 'package:web_radio/utils/utils.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide()),
        //color: ColorConstants.playerColor,
      ),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ------ Details
        Flexible(flex: 1,
            child: Align(alignment: Alignment.centerLeft, child: Text("Radio name --debug"))),
        // ------ Controls
        Flexible(flex: 3, child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.play_arrow_sharp, size: screenHeight(context) * SizeConstants.playerIconRatio,),
          ],
        ),),
        
        // ------- Volume
      ],
    ),);
  }
}
