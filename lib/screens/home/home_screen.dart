import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/restaurant.dart';

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
        // final Welcome data = parseRestaurant(snapshot.data);
        // final List<Restaurant> restaurants = data.restaurants;
        // final Welcome data = Welcome.fromJson(snapshot.data);
        return ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return RestaurantCard(restaurant: restaurants[index]);
          },
        );
      },
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Expanded(
              child: Image.network(
            restaurant.pictureId,
            fit: BoxFit.cover,
          )),
          Column(
            children: [
              Text(
                restaurant.name,
              ),
              Text(restaurant.city),
              RatingBar.builder(
                minRating: 1,
                itemCount: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                initialRating: restaurant.rating,
                itemSize: 12,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (x) => print(x),
              ),
            ],
          )
        ],
      ),
    );
  }
}
