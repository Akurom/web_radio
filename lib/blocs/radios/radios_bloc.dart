import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_radio/models/radio_model.dart';
import 'package:web_radio/repositories/repositories.dart';

part 'radios_event.dart';
part 'radios_state.dart';

class RadiosBloc extends Bloc<RadiosEvent, RadiosState> {
  RadiosBloc({
    required this.radiosRepository,
    required this.countryCode,
  }) : super(RadiosState()) {
    on<GetRadios>(_getRadiosEvent);
  }
  final RadiosRepository radiosRepository;
  final String countryCode;

  void _getRadiosEvent(GetRadios event, Emitter<RadiosState> emit) async {
    try {
      emit(state.copyWith(status: RadiosStatus.loading));

      List<RadioModel> radios = await radiosRepository.getRadiosByCountryCode('jp');

      emit(
        state.copyWith(
          radios: radios,
          status: RadiosStatus.success,
        ),
      );
    } on RadiosFailure catch (e) {
      log(e.error);
      emit(
        state.copyWith(
          status: RadiosStatus.error,
          errorMessage: e.error,
        ),
      );
      addError(e);
    }
  }
}
