import 'package:flutter/material.dart';
import 'package:restaurant_app/theme/style.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int price;

  const ItemCard(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: myBorderRadius,
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover),
            ),
          ),
          Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: myBorderRadius,
              gradient: const LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                margin: const EdgeInsets.all(12),
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: primaryColor),
                    ),
                    Text(
                      "IDR $price",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: primaryColor),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
