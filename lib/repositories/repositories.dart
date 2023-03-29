import 'dart:convert';
import 'dart:developer';
import 'package:basic_utils/basic_utils.dart';
import 'package:dio/dio.dart';
import 'package:web_radio/consts/time_constants.dart';

import 'package:web_radio/models/radio_model.dart';


class RadiosFailure implements Exception {
  RadiosFailure({
    required this.error,
  });
  final String error;
}


class RadiosRepository {

  final dio = Dio();

  String toLookup = "all.api.radio-browser.info";

  Future<List<String>> getRandomizedServers() async {
    List<String> servers = [];

    try {
      List<RRecord>? raw = await DnsUtils.lookupRecord('_api._tcp.radio-browser.info', RRecordType.SRV);
      servers = raw!.map((e) => e.data.substring(0, e.data.length-1).split(' ').last).toList();
      servers.shuffle();
    } catch(e) {
      throw RadiosFailure(error: 'E: Cannot fetch servers list.');
    }
    log(servers.toString());
    return servers;
  }


  Future<List<RadioModel>> getRadiosByCountryCode(String countryCode) async {

    List<String> servers = await getRandomizedServers();

    for (int i = 0; i < servers.length; i++) {
      log('Trying to fetch from http://${servers[i]}/json/stations/bycountrycodeexact/$countryCode?hidebroken=true');
      final response = await dio.get(
        'http://${servers[i]}/json/stations/bycountrycodeexact/$countryCode?hidebroken=true',
        options: Options(
          receiveTimeout: TimeConstants.fetchRadiosTimeout,
          headers: {
            'User-Agent': 'flutter_web_radio/0.1',
            'Content-type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List result = response.data;
        return result.map((e) => RadioModel.fromJson(e)).toList()
          ..sort((e1, e2) => e2.clicktrend.compareTo(e1.clicktrend));
      } else {
        //throw RadiosFailure(error: response.statusMessage!);
      }
    }

    throw RadiosFailure(error: 'E: Cannot fetch radios list.');
  }
}
