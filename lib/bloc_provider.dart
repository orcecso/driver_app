import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({
    super.key,
    required this.child,
    required EnvironmentEnums environment,
  }) :
       _environment = environment,

  final Widget child;
  final EnvironmentEnums _environment;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IBiometricsRepository>.value(
          value: _biometricRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // Add  blocs here if needed
        ],
        child: child,
      ),
    );
  }
}
