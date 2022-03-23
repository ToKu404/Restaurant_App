import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/screens/detail/detail_screen.dart';
import 'package:restaurant_app/theme/style.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.pushNamed(context, DetailScreen.routeName, arguments: restaurant)),
      child: Container(
        padding: const EdgeInsets.all(14),
        child: Stack(
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: myBorderRadius,
                  image: DecorationImage(
                    image: NetworkImage(restaurant.pictureId),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: myBorderRadius,
                gradient: const LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(.3),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 14,
                        ),
                        Text(
                          "${restaurant.rating}",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: primaryColor, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        restaurant.city,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: subtextColor),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
