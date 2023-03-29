import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_radio/blocs/player/player_bloc.dart';
import 'package:web_radio/consts/color_constants.dart';
import 'package:web_radio/consts/size_constants.dart';
import 'package:web_radio/consts/time_constants.dart';
import 'package:web_radio/utils/utils.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({Key? key}) : super(key: key);

  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isPlaying = false;

  @override
  void initState() {
    print("init");
    _controller = AnimationController(vsync: this, duration: TimeConstants.animatedIconDuration);
    _animation = CurvedAnimation(curve: Curves.easeInOutCirc, parent: _controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {

        if (state.status.isPlaying && _isPlaying == false) {
          _isPlaying = true;
          _controller.forward();
        } else if (state.status.isPaused && _isPlaying == true) {
          _isPlaying = false;
          _controller.reverse();
        }

        return Container(
          height: screenHeight(context) * SizeConstants.playerButtonRatio,
          width: screenHeight(context) * SizeConstants.playerButtonRatio,
          decoration: BoxDecoration(
              color: ColorConstants.backGroundColor,
              shape: BoxShape.circle,
              /*border: Border.all(
                  width: screenHeight(context) * SizeConstants.borderRatio, color: ColorConstants.primaryColor),*/
          ),
          child: InkWell(
            customBorder: CircleBorder(
                side: BorderSide(
                    width: screenHeight(context) * SizeConstants.borderRatio, color: ColorConstants.primaryColor)),
            child: Center(
              child: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: _animation,
                size: screenHeight(context) * SizeConstants.playerIconRatio,
              ),
            ),
            onTap: () {
              if (state.status.isPlaying) {
                BlocProvider.of<PlayerBloc>(context).add(PauseEvent());
              } else {
                BlocProvider.of<PlayerBloc>(context).add(PlayEvent());
              }
            },
          ),
        );
      },
    );
  }
}
