import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'bloc/word/word_bloc.dart';
import 'data/service/service_dio_client.dart';
import 'presentation/pages/page_home.dart';

Future<void> main() async {
  await dotenv.load();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<WordBloc>(
        create: (BuildContext context) => WordBloc(client: ServiceDioClient()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ),
      );
}
