import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/screens/detail/detail_screen.dart';
import 'package:restaurant_app/theme/style.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => Navigator.pushNamed(context, DetailScreen.routeName, arguments: restaurant)),
      child: Container(
        width: double.infinity,
        height: 120,
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: myBorderRadius,
            color: Colors.white,
            boxShadow: [myBoxShadow]),
        child: Row(
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: myBorderRadius,
                  image: DecorationImage(
                    image: NetworkImage(restaurant.pictureId),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
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
                          .copyWith(color: subtextColor),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: secondaryColor, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          size: 12,
                          color: subtextColor,
                        ),
                        Text(
                          restaurant.city,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: subtextColor),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
