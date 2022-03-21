import 'dart:convert';
import 'restaurant.dart';

class Parent {
  late List<Restaurant> restaurants;

  Parent({required this.restaurants});

  Parent.fromJson(Map<String, dynamic> parent) {
    restaurants = parent["restaurant"];
  }
}

List<Parent> parseRestaurant(String? json) {
  if (json == null) return [];
  final Parent parsed = jsonDecode(json);
  
  return parsed.map((data) => Parent.fromJson(data)).toList();
}
