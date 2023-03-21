
class RadioModel {

  final String stationuuid;
  final String name;
  final String url;
  final String country;
  final String codec;
  final int bitrate;

  RadioModel.fromJson(Map<String, dynamic> json)
      : stationuuid = json['stationuuid'],
        name = json['name'],
        url = json['url'],
        country = json['country'],
        codec = json['codec'],
        bitrate = json['bitrate'];

  Map<String, dynamic> toJson() => {
    'stationuuid': stationuuid,
    'name': name,
    'url': url,
    'country': country,
    'codec': codec,
    'bitrate': bitrate,
  };
}