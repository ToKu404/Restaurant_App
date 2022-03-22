import 'dart:convert';

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }
  return LocalRestaurant.fromJson(jsonDecode(json)).restaurants;
}

class LocalRestaurant {
  late List<Restaurant> restaurants;

  LocalRestaurant({
    required this.restaurants,
  });

  LocalRestaurant.fromJson(Map<String, dynamic> json) {
    restaurants = List<Restaurant>.from(
        json["restaurants"].map((x) => Restaurant.fromJson(x)));
  }
}

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
  late Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    pictureId = json["pictureId"];
    city = json["city"];
    rating = json["rating"].toDouble();
    menus = Menus.fromJson(json["menus"]);
  }
}

class Menus {
  late List<Item> foods;
  late List<Item> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  Menus.fromJson(Map<String, dynamic> json) {
    foods = List<Item>.from(json["foods"].map((x) => Item.fromJson(x)));
    drinks = List<Item>.from(json["drinks"].map((x) => Item.fromJson(x)));
  }
}

class Item {
  late String name;

  Item({
    required this.name,
  });

  Item.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}
