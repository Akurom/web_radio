
class RadioModel {

  final String stationuuid;
  final String name;
  final String faviconUrl;
  final String url;
  final String country;
  final String codec;
  final int bitrate;

  RadioModel.fromJson(Map<String, dynamic> json)
      : stationuuid = json['stationuuid'],
        name = json['name'],
        faviconUrl = json['favicon'],
        url = json['url'],
        country = json['country'],
        codec = json['codec'],
        bitrate = json['bitrate'];

  Map<String, dynamic> toJson() => {
    'stationuuid': stationuuid,
    'name': name,
    'favicon': faviconUrl,
    'url': url,
    'country': country,
    'codec': codec,
    'bitrate': bitrate,
  };
}