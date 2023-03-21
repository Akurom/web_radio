part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetRadioEvent extends PlayerEvent {
  RadioModel radio;
  SetRadioEvent({required this.radio});
}
class PlayEvent extends PlayerEvent {}
class PauseEvent extends PlayerEvent {}
class StopEvent extends PlayerEvent {}
