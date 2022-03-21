import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString("assets/json/local_restaurant.json"),
      builder: (context, snapshot) {
        final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
        return ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(restaurants[index].name),
            );
          },
        );
      },
    );
  }
}
