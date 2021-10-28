import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_access_named_route/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_access_named_route/presentation/screens/third_screen.dart';

import 'logic/cubit/counter_cubit.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const HomeScreen(
                title: "Home",
                color: Colors.blueAccent,
              ),
            ),
        'second': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondScreen(
                title: "Second",
                color: Colors.redAccent,
              ),
            ),
        'third': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdScreen(
                title: "Third",
                color: Colors.greenAccent,
              ),
            ),
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
