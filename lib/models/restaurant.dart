import 'dart:convert';

import 'menu.dart';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
  late Menu menu;

  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      required this.menu});

  Restaurant.fromJson(Map<String, dynamic> restaurants) {
    id = restaurants["id"];
    name = restaurants["name"];
    description = restaurants["description"];
    pictureId = restaurants["pictureId"];
    city = restaurants["city"];
    rating = restaurants["rating"];
    menu = Menu.fromJson(restaurants["menu"]);
  }
}

