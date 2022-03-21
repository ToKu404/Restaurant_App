import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/home/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const routeName = "/welcome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text("Next"),
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
      ),
    );
  }
}
