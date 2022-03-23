import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/theme/style.dart';
import 'list_card.dart';

class SearchSection extends SearchDelegate {
  late List<Restaurant> data;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Icons.clear,
          color: primaryColor,
        ),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (data.isEmpty) {
      return Center(
          child: Text(
        "Hasil Tidak Ditemukan",
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: secondaryColor),
      ));
    } else {
      return _listBuilder();
    }
  }

  ListView _listBuilder() {
    return ListView.builder(
      padding: const EdgeInsets.all(14),
      itemBuilder: ((context, index) {
        return ListCard(
          restaurant: data[index],
        );
      }),
      itemCount: data.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<String>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          data = searchRestaurant(snapshot.data, query);
          return _listBuilder();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: rootBundle.loadString("assets/json/local_restaurant.json"),
    );
  }
}
