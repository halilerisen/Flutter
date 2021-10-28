import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';
import '../../logic/cubit/counter_cubit.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(
              title: 'Home',
              color: Colors.blueAccent,
            ),
          ),
        );

      case 'second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondScreen(
              title: 'Second',
              color: Colors.redAccent,
            ),
          ),
        );

      case 'third':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const ThirdScreen(
              title: 'Third',
              color: Colors.greenAccent,
            ),
          ),
        );

       default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
