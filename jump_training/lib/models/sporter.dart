import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Sporter extends Equatable {
  String name;
  List<double> jumpList;
  double weight;
  late double highestJump;
  late double lowestJump;
  late double arithmeticAverage;
  late double lewisPower;

  Sporter({
    required this.name,
    required this.jumpList,
    this.weight = 85,
  }) {
    arithmeticAverage = getSporterArithmeticAverage();
    highestJump = getSporterTheHighestJump();
    lowestJump = getSporterLowestJump();
    lewisPower = getSporterLewisPower(weight, arithmeticAverage);
  }

  double getSporterArithmeticAverage() {
    double arithmeticAverage = jumpList.fold(0, (previousValue, element) => previousValue + element);
    return arithmeticAverage / jumpList.length;
  }

  double getSporterTheHighestJump() {
    //Hazır fonksiyon
    // maxJump = jumpList.reduce(max);

    //Manuel
    double maxJump = jumpList[0];
    for (var jump in jumpList) {
      if (jump > maxJump) maxJump = jump;
    }

    return maxJump;
  }

  double getSporterLowestJump() {
    // minJump = jumpList.reduce(min);
    double minJump = jumpList[0];

    for (var jump in jumpList) {
      if (jump < minJump) minJump = jump;
    }

    return minJump;
  }

  double getSporterLewisPower(double weight, double arithmeticAverage) {
    return sqrt(4.9 * weight) * sqrt(4.9 * arithmeticAverage) * 9.81;
  }

  @override
  List<Object?> get props => [
        name,
        jumpList,
        weight,
        highestJump,
        lowestJump,
        arithmeticAverage,
        lewisPower,
      ];
}
