import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LoadingProcess extends StatelessWidget {
  const LoadingProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: GlobalColors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(18),
          child: const CircularProgressIndicator(
            color: GlobalColors.primary,
          ),
        ),
      ),
    );
  }
}
