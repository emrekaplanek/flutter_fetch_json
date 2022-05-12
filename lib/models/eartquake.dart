import 'dart:convert';

import 'package:flutter/material.dart';

class Eartquake {
  String date;
  String time;
  String latitude;
  String longitutde;
  String deepness;
  String magnitude;
  String place;
  String city;
  Eartquake({
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
      'city': city,
    };
  }

  factory Eartquake.fromMap(Map<String, dynamic> map) {
    return Eartquake(
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      latitude: map['latitude'] ?? '',
      longitutde: map['longitutde'] ?? '',
      deepness: map['deepness'] ?? '',
      magnitude: map['magnitude'] ?? '',
      place: map['place'] ?? '',
      city: map['city'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Eartquake.fromJson(String source) =>
      Eartquake.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Eartquake(date: $date, time: $time, latitude: $latitude, longitutde: $longitutde, deepness: $deepness, magnitude: $magnitude, place: $place, city: $city)';
  }
}
