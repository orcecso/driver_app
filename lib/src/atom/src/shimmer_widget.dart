import 'package:flutter/material.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -1, end: 2).animate(
      CurvedAnimation(
        parent: _shimmerController, 
        curve: Curves.linear
      )
    );
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            // Original child with opacity to create shimmer effect
            Opacity(
              opacity: 0.3,
              child: widget.child,
            ),
            // Shimmer overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  gradient: LinearGradient(
                    colors: const [
                       Color.fromARGB(255, 243, 243, 248),
                       Color.fromARGB(255, 255, 255, 255),
                       Color.fromARGB(255, 243, 243, 248),
                    ],
                    stops: const [0.1, 0.5, 0.9],
                    begin: Alignment(_animation.value, -0.3),
                    end: Alignment(_animation.value + 1, 0.3),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

