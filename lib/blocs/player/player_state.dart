part of 'player_bloc.dart';


enum PlayerStatus { initial, playing, paused, error }

extension PlayerStatusX on PlayerStatus {
  bool get isInitial => this == PlayerStatus.initial;
  bool get isPlaying => this == PlayerStatus.playing;
  bool get isPaused => this == PlayerStatus.paused;
  bool get isError => this == PlayerStatus.error;
}

class PlayerState extends Equatable {
  const PlayerState({
    this.status = PlayerStatus.initial,
    RadioModel? radio,
    String? errorMessage,
  })
      : radio = radio ?? RadioModel.empty,
        errorMessage = errorMessage ?? '';

  final PlayerStatus status;
  final RadioModel radio;
  final String errorMessage;

  @override
  List<Object?> get props => [
    status,
    radio,
    errorMessage,
  ];

  PlayerState copyWith({
    PlayerStatus? status,
    final RadioModel? radio,
    String? errorMessage,
  }) {
    return PlayerState(
      status: status ?? this.status,
      radio: radio ?? this.radio,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
