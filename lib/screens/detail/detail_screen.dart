import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:restaurant_app/data/fake_data.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/theme/style.dart';
import 'widgets/item_card.dart';

class DetailScreen extends StatelessWidget {
  final Restaurant restaurant;
  static const routeName = "/detail";
  const DetailScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                title: Text(
                  "Restaurant Profile",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: primaryColor),
                  textAlign: TextAlign.center,
                ),
                backgroundColor: secondaryColor,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: myBorderRadius,
                      color: Colors.grey.withOpacity(.5),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: primaryColor,
                    ),
                  ),
                ),
                expandedHeight: MediaQuery.of(context).size.height * 2 / 5,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Hero(
                        tag: restaurant.pictureId,
                        child: Image.network(
                          restaurant.pictureId,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 2 / 5,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(bottom: Radius.circular(8)),
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.transparent],
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Text(
                  restaurant.city,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: subtextColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  restaurant.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: secondaryColor),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    RatingBar.builder(
                        minRating: 1,
                        itemCount: 5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        initialRating: restaurant.rating,
                        itemSize: 20,
                        itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                        unratedColor: subtextColor,
                        onRatingUpdate: (rating) {
                          print(rating);
                        }),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("${restaurant.rating}",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: subtextColor,
                            ))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                margin: const EdgeInsets.only(top: 16),
                child: ReadMoreText(
                  restaurant.description,
                  trimLines: 5,
                  trimMode: TrimMode.Line,
                  colorClickableText: Colors.blueAccent,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: secondaryColor),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Foods",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700, color: secondaryColor),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              _foodsSection(),
              const SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Drinks",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700, color: secondaryColor),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              _drinksSection(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _drinksSection() {
    return SizedBox(
      height: 200,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: restaurant.menus.drinks.map(
          (drink) {
            return ItemCard(
              name: drink.name,
              imageUrl: FakeData.getRandomDrink(),
              price: FakeData.getRandomPrice(),
            );
          },
        ).toList(),
      ),
    );
  }

  SizedBox _foodsSection() {
    return SizedBox(
      height: 200,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: restaurant.menus.foods.map(
          (food) {
            return ItemCard(
              name: food.name,
              imageUrl: FakeData.getRandomFood(),
              price: FakeData.getRandomPrice(),
            );
          },
        ).toList(),
      ),
    );
  }
}
