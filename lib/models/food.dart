class Food {
  late String? name;

  Food({required this.name});

  Food.fromJson(Map<String, String> foods) {
    name = foods["name"];
  }
}
