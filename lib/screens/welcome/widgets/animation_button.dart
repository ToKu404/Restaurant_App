import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);

    _animation = Tween(begin: const Offset(-0.05, 0), end: const Offset(0.05, 0))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: SlideTransition(
        position: _animation,
        child: const Icon(
          Icons.keyboard_arrow_right_outlined,
          size: 28,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
