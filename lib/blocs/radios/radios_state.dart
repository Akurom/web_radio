part of 'radios_bloc.dart';


enum RadiosStatus { initial, success, error, loading }

extension RadiosStatusX on RadiosStatus {
  bool get isInitial => this == RadiosStatus.initial;
  bool get isLoading => this == RadiosStatus.loading;
  bool get isSuccess => this == RadiosStatus.success;
  bool get isError => this == RadiosStatus.error;
}

class RadiosState extends Equatable {
  RadiosState({
    this.status = RadiosStatus.initial,
    List<RadioModel>? radios,
    String? errorMessage,
  })
    : radios = radios ?? [],
      errorMessage = errorMessage ?? '';

  final RadiosStatus status;
  final List<RadioModel> radios;
  final String errorMessage;

  @override
  List<Object?> get props => [
    status,
    radios,
    errorMessage,
  ];

  RadiosState copyWith({
    RadiosStatus? status,
    final List<RadioModel>? radios,
    String? errorMessage,
  }) {
    return RadiosState(
      status: status ?? this.status,
      radios: radios ?? this.radios,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
