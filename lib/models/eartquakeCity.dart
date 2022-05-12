import 'dart:convert';

import 'package:json_fetch_example/models/city.dart';

class EartquakeCity {
  String date;
  String time;
  String latitude;
  String longitutde;
  String deepness;
  String magnitude;
  String place;
  City city;
  EartquakeCity({
    required this.date,
    required this.time,
    required this.latitude,
    required this.longitutde,
    required this.deepness,
    required this.magnitude,
    required this.place,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'time': time,
      'latitude': latitude,
      'longitutde': longitutde,
      'deepness': deepness,
      'magnitude': magnitude,
      'place': place,
      'city': city.toMap(),
    };
  }

  factory EartquakeCity.fromMap(Map<String, dynamic> map) {
    return EartquakeCity(
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      latitude: map['latitude'] ?? '',
      longitutde: map['longitutde'] ?? '',
      deepness: map['deepness'] ?? '',
      magnitude: map['magnitude'] ?? '',
      place: map['place'] ?? '',
      city: City.fromMap(map['city']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EartquakeCity.fromJson(String source) =>
      EartquakeCity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EartquakeCity(date: $date, time: $time, latitude: $latitude, longitutde: $longitutde, deepness: $deepness, magnitude: $magnitude, place: $place, city: $city)';
  }
}
