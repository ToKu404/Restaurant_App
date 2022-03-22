import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/home/home_screen.dart';

import 'widgets/animation_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const routeName = "/welcome";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double posX = 0.0;
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(
            "https://source.unsplash.com/1H30uRC1plc/",
            width: mediaQueryWidth,
            height: mediaQueryHeight,
            fit: BoxFit.cover,
          ),
          Container(
            height: mediaQueryHeight / 2,
            width: mediaQueryWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color(0xFF000000).withOpacity(.75),
                Colors.transparent
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQueryWidth / 8, vertical: 24),
            height: mediaQueryHeight / 2,
            width: double.infinity,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Text(
                      "Find your table for any occasion",
                      style: TextStyle(
                          height: 1.2,
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          fontSize: 36),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "an unrivaled selection of restaurant for whatever you want",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 13),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 80,
                  width: 235,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Positioned(
                        left: posX,
                        child: GestureDetector(
                          onHorizontalDragUpdate: (DragUpdateDetails details) {
                            setState(() {
                              if (posX < 235 - 20 - 60 - 10) {
                                double delta = details.delta.dx;
                                posX += delta;
                              } else {
                                Navigator.of(context)
                                    .pushReplacementNamed(HomeScreen.routeName);
                              }
                            });
                          },
                          child: const AnimatedButton(),
                        ),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
          )
        ],
      ),
    ));
  }
}
