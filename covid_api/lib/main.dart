import 'package:covid_api/services/covid_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Gui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => CovidApiService.create(),
      dispose: (context, CovidApiService service) => service.client.dispose(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid-19 Statistics Information App',
        theme: ThemeData.dark(),
        home: const HomePage(title: 'Covid-19 Statistics'),
      ),
    );
  }
}
