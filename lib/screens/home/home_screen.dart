import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/screens/home/widgets/grid_card.dart';
import 'package:restaurant_app/theme/style.dart';
import 'widgets/search_section.dart';
import 'widgets/list_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isGridMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OurResto"),
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: secondaryColor),
          child: const Icon(
            Icons.restaurant,
            color: primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchSection());
            },
            icon: const Icon(Icons.search),
          ),
          _popupMenuButton(),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString("assets/json/local_restaurant.json"),
          builder: (context, snapshot) {
            final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return _isGridMode
                  ? _gridBuilder(restaurants)
                  : _listBuilder(restaurants);
            }
          },
        ),
      ),
    );
  }

  PopupMenuButton<int> _popupMenuButton() {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            child: Text("Grid Mode"),
            value: 0,
          ),
          const PopupMenuItem(
            child: Text("List Mode"),
            value: 1,
          ),
        ];
      },
      onSelected: (value) {
        if (value == 0) {
          setState(() {
            _isGridMode = true;
          });
        } else {
          setState(() {
            _isGridMode = false;
          });
        }
      },
    );
  }

  ListView _listBuilder(List<Restaurant> restaurants) {
    return ListView.builder(
      padding: const EdgeInsets.all(14),
      itemBuilder: (context, index) {
        return ListCard(restaurant: restaurants[index]);
      },
      itemCount: restaurants.length,
    );
  }

  GridView _gridBuilder(List<Restaurant> restaurants) {
    return GridView.builder(
      padding: const EdgeInsets.all(14),
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        return GridCard(restaurant: restaurants[index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5 / 6,
      ),
    );
  }
}
