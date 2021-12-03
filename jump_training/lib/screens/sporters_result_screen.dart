import 'package:flutter/material.dart';
import 'package:jump_training/cubit/sporters_cubit.dart';
import 'package:jump_training/models/sporter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportersResultScreen extends StatelessWidget {
  const SportersResultScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Liste uzaması durumuna karşılık scroll
    return SingleChildScrollView(
      child: BlocBuilder<SportersCubit, SportersState>(
        builder: (context, state) {
          //State Kontrol
          if (state is SportersLoaded) {
            return DataTable(
              columnSpacing: 15,
              columns: const <DataColumn>[
                //State Sütunları
                DataColumn(
                  label: Text(
                    'Oyuncu Adı',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Kilo',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Lewis',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Ortalama',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'En Yüksek',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              //sporterList içerisindeki verileri DataRow listesine dönüştürme
              rows: getRows(state.sporterList),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

List<DataRow> getRows(List<Sporter> sporterList) {
  List<DataRow> tempList = [];
  for (var item in sporterList) {
    var row = DataRow(
      cells: <DataCell>[
        DataCell(Text(item.name)),
        DataCell(Text(item.weight.toStringAsFixed(2))),
        DataCell(Text(item.lewisPower.toStringAsFixed(2))),
        DataCell(Text(item.arithmeticAverage.toStringAsFixed(2))),
        DataCell(Text(item.highestJump.toStringAsFixed(2))),
      ],
    );
    tempList.add(row);
  }
  return tempList;
}
