
class RadioModel {

  final String stationuuid;
  final String name;
  final String faviconUrl;
  final String url;
  final String country;
  final String codec;
  final int bitrate;
  final int clicktrend;
  final int clickcount;
  final String tags;

  const RadioModel({
    required this.stationuuid,
    required this.name,
    required this.faviconUrl,
    required this.url,
    required this.country,
    required this.codec,
    required this.bitrate,
    required this.clicktrend,
    required this.clickcount,
    required this.tags,
  });

  static const empty = RadioModel(
    stationuuid: '',
    name: '',
    faviconUrl: '',
    url: '',
    country: '',
    codec: '',
    bitrate: 0,
    clicktrend: 0,
    clickcount: 0,
    tags: '',
  );

  RadioModel.fromJson(Map<String, dynamic> json)
      : stationuuid = json['stationuuid'],
        name = json['name'],
        faviconUrl = json['favicon'],
        url = json['url'],
        country = json['country'],
        codec = json['codec'],
        bitrate = json['bitrate'],
        clicktrend = json['clicktrend'],
        clickcount = json['clickcount'],
        tags = json['tags'];

  Map<String, dynamic> toJson() => {
    'stationuuid': stationuuid,
    'name': name,
    'favicon': faviconUrl,
    'url': url,
    'country': country,
    'codec': codec,
    'bitrate': bitrate,
    'clicktrend': clicktrend,
    'clickcount': clickcount,
    'tags': tags,
  };
}