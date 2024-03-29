import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:web_radio/models/radio_model.dart';
import 'package:web_radio/repositories/repositories.dart';

part 'player_event.dart';

part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  RadioModel radio = RadioModel.empty;
  final AudioPlayer audioPlayer = AudioPlayer();

  PlayerBloc() : super(const PlayerState()) {
    on<SetRadioAndPlayEvent>(_setRadioAndPlayEvent);
    on<PlayEvent>(_playEvent);
    on<PauseEvent>(_pauseEvent);
    on<StopEvent>(_stopEvent);
  }

  void _setRadioAndPlayEvent(SetRadioAndPlayEvent event, Emitter<PlayerState> emit) async {
    radio = event.radio;
    log(radio.name);
    add(StopEvent());
    await audioPlayer.setUrl(radio.url);
    add(PlayEvent());
    emit(
      state.copyWith(
        radio: radio,
        status: PlayerStatus.playing,
      ),
    );
  }

  void _playEvent(PlayEvent event, Emitter<PlayerState> emit) async {

    audioPlayer.play();
    emit(
      state.copyWith(
        radio: radio,
        status: PlayerStatus.playing,
      ),
    );
  }

  void _pauseEvent(PauseEvent event, Emitter<PlayerState> emit) async {
    log('PauseEvent');
    audioPlayer.pause();
    emit(
      state.copyWith(
        radio: radio,
        status: PlayerStatus.paused,
      ),
    );
  }

  void _stopEvent(StopEvent event, Emitter<PlayerState> emit) async {
    log('StopEvent');
    audioPlayer.pause();
    //radio = RadioModel.empty;
    emit(
      state.copyWith(
        radio: radio,
        status: PlayerStatus.paused,  //initial
      ),
    );
  }
}
