import 'package:flutter/material.dart';

class BouncingAnimation extends StatefulWidget {
  final Widget? child;
  final VoidCallback onTap;

  const BouncingAnimation({
    required this.child,
    Key? key,
    required this.onTap,
  })  : assert(child != null),
        super(key: key);

  @override
  _BouncingAnimationState createState() => _BouncingAnimationState();
}

class _BouncingAnimationState extends State<BouncingAnimation> with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        if (widget.onTap != null) {
          _controller.forward();
        }
      },
      onPointerUp: (PointerUpEvent event) {
        if (widget.onTap != null) {
          _controller.reverse();
          widget.onTap();
        }
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
