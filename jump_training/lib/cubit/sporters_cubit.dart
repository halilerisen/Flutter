import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

import 'package:jump_training/calculates.dart';
import 'package:jump_training/models/char.dart';
import 'package:jump_training/models/sporter.dart';

part 'sporters_state.dart';

class SportersCubit extends Cubit<SportersState> {
  final Calculates _calculates;

  SportersCubit({
    required Calculates calculates,
  })  : _calculates = calculates,
        super(SportersInitial());

  //? Get Data
  Future<void> readJson() async {
    Calculates calculates = Calculates();
    final jsonData = await rootBundle.loadString('assets/data.json');

    final List jsonSporters = json.decode(jsonData)['sporters'];
    final List<Sporter> sporterListMaxToMinJump = [];

    for (var i = 0; i < jsonSporters.length; i++) {
      List<double> sporterJumpList = List<double>.from(jsonSporters[i]['sporter_$i']);

      Sporter sporter = Sporter(
        name: 'sporter_$i',
        jumpList: sporterJumpList,
      );

      sporterListMaxToMinJump.add(sporter);
    }

    var sortedList = [...calculates.sporterSortForHighestJump(sporterListMaxToMinJump)];

    emit(SportersLoaded(
      sporterList: sortedList,
      allArithmeticAverage: _calculates.getAllArithmeticAverage(sortedList),
      theHighestJumpSporters: _calculates.getTheHighestJumpSporters(sortedList),
      theLowestJumpSporters: _calculates.getTheLowestJumpSporters(sortedList),
      chartData: _calculates.getChartData(sortedList),
      chartDataCounter: _calculates.getChartData(sortedList).fold(0, (previousValue, element) => previousValue + element.mount),
    ));
  }
}
