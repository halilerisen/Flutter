import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculates.dart';
import 'cubit/sporters_cubit.dart';
import 'screens/all_statistic_screen.dart';
import 'screens/sporters_result_screen.dart';

void main() {
  runApp(MyApp(
    calculates: Calculates(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required Calculates calculates,
  })  : _calculates = calculates,
        super(key: key);
  //Hesaplama İşlemleri için kullanılacak nesne
  final Calculates _calculates;

  @override
  Widget build(BuildContext context) {
    //Global SportersCubit
    return BlocProvider(
      create: (context) => SportersCubit(calculates: _calculates)..readJson(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    //Tab Controller
    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white.withOpacity(0.7),
              tabs: const [
                Text('OYUNCULARIN SONUÇLARI'),
                Text('TÜM İSTATİSTİKLER'),
              ],
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          //Sporcu Liste Sayfası
          SportersResultScreen(),
          //İstatistik Sayfası
          AllStatistics(),
        ],
      ),
    );
  }
}
