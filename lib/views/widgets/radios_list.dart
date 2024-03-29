import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_radio/blocs/radios/radios_bloc.dart';
import 'package:web_radio/views/widgets/radio_row.dart';

class RadiosList extends StatelessWidget {
  const RadiosList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadiosBloc, RadiosState>(
      builder: (context, state) {

        log(state.status.toString());

        if (state.status.isInitial || state.status.isLoading) {
          return CircularProgressIndicator();
        } else if (state.status.isSuccess) {

          return Expanded(child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: state.radios.length,
              itemBuilder: (BuildContext context, int index) {
                return RadioRow(radio: state.radios[index]);
              }));
        }
        return CircularProgressIndicator();
      },
    );
  }
}
