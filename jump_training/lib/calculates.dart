import 'models/char.dart';
import 'models/sporter.dart';

class Calculates {
  //* İstatistik Fonksiyonları
  double getAllArithmeticAverage(List<Sporter> sporters) {
    //ziplamalari toplama
    double sum = sporters.fold(
      0,
      (previousValue, element) => previousValue + element.jumpList.fold(0, (previousValue, element) => previousValue + element),
    );

    //ziplama sayisini bulma
    int length = sporters.fold(
      0,
      (previousValue, element) => previousValue + element.jumpList.length,
    );

    return sum / length;
  }

  List<Sporter> getTheHighestJumpSporters(List<Sporter> sortedForHighestJumpList) {
    //Sırali liste geldiği için ilk eleman en büyüktür
    List<Sporter> highestJumpList = [sortedForHighestJumpList[0]];

    for (var i = 0; i < sortedForHighestJumpList.length - 1; i++) {
      double currentSporterHighestJump = sortedForHighestJumpList[i].highestJump;
      double nextSporterHighestJump = sortedForHighestJumpList[i + 1].highestJump;

      //Sıralı liste'de 1.eleman 2.elemandan büyük ise en büyüktür.
      if (currentSporterHighestJump > nextSporterHighestJump) break;
      highestJumpList.add(sortedForHighestJumpList[i + 1]);
    }

    return highestJumpList;
  }

  List<Sporter> getTheLowestJumpSporters(List<Sporter> sporterList) {
    //Sırali liste geldiği için son eleman en küçüktür
    List<Sporter> lowestJumpList = [sporterList[sporterList.length - 1]];

    for (var i = sporterList.length - 1; i > 0; i--) {
      double currentSporterLowestJump = sporterList[i].lowestJump;
      double nextSporterLowestJump = sporterList[i - 1].lowestJump;

      //Sıralı liste'de son eleman 1 önceki elemandan küçük ise en küçüktür.
      if (currentSporterLowestJump < nextSporterLowestJump) break;
      lowestJumpList.add(sporterList[i - 1]);
    }

    return lowestJumpList;
  }

  List<Chart> getChartData(List<Sporter> sporters) {
    List<Chart> list = [];
    double limit = getAllArithmeticAverage(sporters) * 15 / 100;

    for (var i = 0; i < sporters.length; i++) {
      int counter = 0;
      var jumpList = sporters[i].jumpList;

      for (var j = 0; j < jumpList.length; j++) {
        if (jumpList[j] >= limit) counter++;
      }

      Chart chart = Chart(name: sporters[i].name.replaceFirst('sporter_', ''), mount: counter);
      list.add(chart);
    }

    return list;
  }

  //* insertion sort ile siralama
  List<Sporter> sporterSortForHighestJump(List<Sporter> sporters) {
    for (var i = 1; i < sporters.length; i++) {
      for (var j = i; j > 0; j--) {
        if (sporters[j].highestJump < sporters[j - 1].highestJump) {
          var temp2 = sporters[j];
          sporters[j] = sporters[j - 1];
          sporters[j - 1] = temp2;
        } else {
          break;
        }
      }
    }

    return sporters.reversed.toList();
  }
}
