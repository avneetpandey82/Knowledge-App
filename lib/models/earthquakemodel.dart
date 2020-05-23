import 'dart:convert';
import 'package:http/http.dart' as http;

class Earthquake {
  double mag;
  String place;
  int time;
  double longitude;
  double latitude;
  double depth;

  Earthquake(
      {this.mag,
      this.place,
      this.time,
      this.longitude,
      this.latitude,
      this.depth});

  factory Earthquake.fromJson(Map json) {
    return Earthquake(
      mag: json['properties']['mag']
          .toDouble(), //we use .todouble because if there is any integer value comes then it popup
      place: json['properties']['place'], //error
      time: json['properties']['time'],
      longitude: json['geometry']['coordinates'][0].toDouble(),
      latitude: json['geometry']['coordinates'][1].toDouble(),
      depth: json['geometry']['coordinates'][2].toDouble(),
    );
  }
}

Future<List<Earthquake>> fetchEarthquakes() async {
  http.Response res = await http.get(
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson');
  if (res.statusCode == 200) {
    List<Map<String, dynamic>> mapList =
        json.decode(res.body)['features'].cast<Map<String, dynamic>>();
    List<Earthquake> list = mapList.map((Map json) {
      return Earthquake.fromJson(json);
    }).toList();
    print(list.length);
    return list;
  } else
    print("data not found");
  return null;
}
