import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_radio/blocs/player/player_bloc.dart';
import 'package:web_radio/consts/color_constants.dart';
import 'package:web_radio/consts/size_constants.dart';
import 'package:web_radio/utils/utils.dart';
import 'package:web_radio/views/widgets/player/play_pause_button.dart';

class Player extends StatelessWidget {
  Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            /*border: Border(
              top: BorderSide(
                width: screenHeight(context) * SizeConstants.borderRatio,
            )),*/
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ------ Details
              /*Flexible(
                  flex: 1,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        state.status.isPlaying ? state.radio.name : '--',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ))),*/
              Padding(padding: EdgeInsets.all(screenHeight(context) * SizeConstants.defaultPaddingRatio),),
              // ------ Controls
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlayPauseButton(),
                  ],
                ),
              ),

              Padding(padding: EdgeInsets.all(screenHeight(context) * SizeConstants.defaultPaddingRatio),),

              // ------- Volume
            ],
          ),
        );

  }
}
