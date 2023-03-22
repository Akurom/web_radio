part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SetRadioAndPlayEvent extends PlayerEvent {
  RadioModel radio;
  SetRadioAndPlayEvent({required this.radio});
}
class PlayEvent extends PlayerEvent {}
class PauseEvent extends PlayerEvent {}
class StopEvent extends PlayerEvent {}
