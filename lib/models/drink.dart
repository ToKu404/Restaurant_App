class Drink {
  late String? name;

  Drink({required this.name});

  Drink.fromJson(Map<String, String> drinks) {
    name = drinks["name"];
  }
}
