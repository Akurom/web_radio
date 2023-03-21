import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:web_radio/models/radio_model.dart';


class RadiosFailure implements Exception {
  RadiosFailure({
    required this.error,
  });
  final String error;
}


class RadiosRepository {

  final dio = Dio();

  Future<List<RadioModel>> getRadiosByCountryCode(String countryCode) async {

    final response = await dio.get(
        'https://de1.api.radio-browser.info/json/stations/bycountrycodeexact/$countryCode?hidebroken=true',
        options: Options(
          headers: {
            'User-Agent': 'flutter_web_radio/0.1',
            'Content-type': 'application/json',
          },
        ),
    );

    if (response.statusCode == 200) {
      final List result = response.data;
      return result.map((e) => RadioModel.fromJson(e)).toList()..sort((e1, e2) => e2.clicktrend.compareTo(e1.clicktrend));
    } else {
      throw RadiosFailure(error: response.statusMessage!);
    }
  }
}
