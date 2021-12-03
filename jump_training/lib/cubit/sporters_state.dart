// ignore_for_file: must_be_immutable

part of 'sporters_cubit.dart';

abstract class SportersState extends Equatable {
  const SportersState();

  @override
  List<Object> get props => [];
}

class SportersInitial extends SportersState {
  @override
  List<Object> get props => [];
}

class SportersLoaded extends SportersState {
  List<Sporter> sporterList;
  double allArithmeticAverage;
  List<Sporter> theHighestJumpSporters;
  List<Sporter> theLowestJumpSporters;
  List<Chart> chartData;
  int chartDataCounter;

  SportersLoaded({
    required this.sporterList,
    required this.allArithmeticAverage,
    required this.theHighestJumpSporters,
    required this.theLowestJumpSporters,
    required this.chartData,
    required this.chartDataCounter,
  });

  @override
  List<Object> get props => [
        sporterList,
        allArithmeticAverage,
        theHighestJumpSporters,
        theLowestJumpSporters,
        chartData,
        chartDataCounter,
      ];
}
