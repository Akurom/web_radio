
import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:web_radio/models/radio_model.dart';


class RadioRepository {

  // todo url

  final dio = Dio();

  Future<List<RadioModel>> getRadiosByCountryCode(String countryCode) async {

    //List<RadioModel> radios = [];

    final response = await dio.get('https://de1.api.radio-browser.info/json/stations/bycountrycodeexact/$countryCode',
      options: Options(
        headers: {
          'User-Agent': 'flutter_web_radio/0.1',
          'Content-type': 'application/json',
        },
      )
    );
    //print(response);

    if (response.statusCode == 200) {
      final List result = response.data;
      print(result);
      return result.map((e) => RadioModel.fromJson(e)).toList();
    } else {
      throw Exception(response.statusMessage);
    }
  }
}