import 'package:flutter/material.dart';

/// Wraps [child] in a gentle, continuous up-and-down floating motion.
class FloatingBox extends StatefulWidget {
  const FloatingBox({
    super.key,
    required this.child,
    this.amplitude = 8,
    this.duration = const Duration(seconds: 3),
    this.delay = Duration.zero,
  });

  final Widget child;
  final double amplitude;
  final Duration duration;
  final Duration delay;

  @override
  State<FloatingBox> createState() => _FloatingBoxState();
}

class _FloatingBoxState extends State<FloatingBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _offset = Tween<double>(begin: -widget.amplitude, end: widget.amplitude)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_controller);

    Future.delayed(widget.delay, () {
      if (mounted) _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offset,
      builder: (context, child) {
        return Transform.translate(offset: Offset(0, _offset.value), child: child);
      },
      child: widget.child,
    );
  }
}
