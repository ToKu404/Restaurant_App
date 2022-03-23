import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/home/home_screen.dart';
import 'package:restaurant_app/theme/style.dart';
import 'widgets/animation_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = "/welcome";
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _posX = 0.0;
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _background(mediaQueryWidth, mediaQueryHeight),
            _gradientBg(mediaQueryHeight, mediaQueryWidth),
            _dataSection(mediaQueryWidth, mediaQueryHeight, context)
          ],
        ),
      ),
    );
  }

  Container _dataSection(
      double mediaQueryWidth, double mediaQueryHeight, BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: mediaQueryWidth / 8, vertical: 24),
      height: mediaQueryHeight / 2,
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Find your table for any occasion",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                    "an unrivaled selection of restaurant for whatever you want",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: primaryColor)),
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
                    left: _posX,
                    child: GestureDetector(
                      onHorizontalDragUpdate: (DragUpdateDetails details) {
                        setState(
                          () {
                            if (_posX < 235 - 20 - 60 - 10) {
                              double delta = details.delta.dx;
                              _posX = _posX < 0 ? 0 : _posX + delta;
                            } else {
                              Navigator.of(context)
                                  .pushReplacementNamed(HomeScreen.routeName);
                            }
                          },
                        );
                      },
                      child: const AnimatedButton(),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Get Started",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _gradientBg(double mediaQueryHeight, double mediaQueryWidth) {
    return Container(
      height: mediaQueryHeight,
      width: mediaQueryWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          const Color(0xFF000000).withOpacity(.7),
          Colors.transparent
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
    );
  }

  Image _background(double mediaQueryWidth, double mediaQueryHeight) {
    return Image.network(
      "https://source.unsplash.com/nmpW_WwwVSc/",
      width: mediaQueryWidth,
      height: mediaQueryHeight,
      fit: BoxFit.cover,
    );
  }
}
