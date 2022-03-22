import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/detail/detail_screen.dart';
import 'package:restaurant_app/screens/welcome/welcome_screen.dart';
import 'package:restaurant_app/theme/style.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Local Restaurant App",
      theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              secondary: secondaryColor,
              onPrimary: secondaryColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: myTextTheme,
          appBarTheme: const AppBarTheme(elevation: 0)),
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        DetailScreen.routeName: (context) => const DetailScreen(),
      },
    );
  }
}
