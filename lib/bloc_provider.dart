import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: const [
        // RepositoryProvider<IBiometricsRepository>.value(
        //   value: _biometricRepository,
        // ),
      ],
      child: MultiBlocProvider(
        providers: const [
          // Add  blocs here if needed
        ],
        child: child,
      ),
    );
  }
}
