import 'drink.dart';
import 'food.dart';

class Menu {
  late Food foods;
  late Drink drinks;

  Menu({required this.foods, required this.drinks});

  Menu.fromJson(Map<String, dynamic> menu) {
    foods:
    Food.fromJson(menu["foods"]);

    drinks:
    Drink.fromJson(menu["drinks"]);
  }
}
