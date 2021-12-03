import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jump_training/cubit/sporters_cubit.dart';
import 'package:jump_training/models/sporter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import '../models/char.dart';
import 'pdf_preview_screen.dart';

class AllStatistics extends StatefulWidget {
  const AllStatistics({
    Key? key,
  }) : super(key: key);

  @override
  State<AllStatistics> createState() => _AllStatisticsState();
}

class _AllStatisticsState extends State<AllStatistics> {
  //Pdf'e eklenicek grafiğin ekran görüntüsünü alma
  ScreenshotController screenshotController = ScreenshotController();

  //Yazı Stilleri
  TextStyle titleTextStyle = const TextStyle(fontSize: 25);
  TextStyle normalTextStyle = const TextStyle(fontSize: 16);

  final pdf = pw.Document();
  String pdfPath = "/storage/emulated/0/Download/results.pdf";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SportersCubit, SportersState>(
          builder: (context, state) {
            //State kontrol
            if (state is SportersLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('En Yüksek Zıplayanlar', style: titleTextStyle),
                  const SizedBox(height: 10),
                  Text(
                    state.theHighestJumpSporters.fold('', (previousValue, element) => '$previousValue ${element.name} = ${element.highestJump} cm '),
                    style: normalTextStyle,
                  ),
                  const SizedBox(height: 20),
                  Text('En Düşük Zıplayanlar', style: titleTextStyle),
                  const SizedBox(height: 10),
                  Text(
                    state.theLowestJumpSporters.fold('', (previousValue, element) => previousValue + ' ${element.name}= ${element.lowestJump} cm'),
                    style: normalTextStyle,
                  ),
                  const SizedBox(height: 20),
                  Text('Genel Aritmetik Ortalama', style: titleTextStyle),
                  const SizedBox(height: 10),
                  Text(
                    '${state.allArithmeticAverage.toStringAsFixed(2)} cm',
                    style: normalTextStyle,
                  ),
                  const SizedBox(height: 20),
                  Text('Grafik', style: titleTextStyle),
                  Text("%15'den fazla olan zıplama sayısı : ${state.chartDataCounter.toString()}", style: normalTextStyle),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Screenshot(
                      controller: screenshotController,
                      child: charts.BarChart(
                        _buildSeries(sporterList: state.sporterList, chartData: state.chartData),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text('Kaydet'),
                    onPressed: () async {
                      //Kullanıcıdan yazma izni
                      var status = await Permission.storage.status;

                      if (!status.isGranted) {
                        await Permission.storage.request();
                      }

                      //Pdf dosyası oluşturma
                      _writeOnPdf(
                        sporterList: state.sporterList,
                        screenShoot: await _takeScreenShoot(),
                        theHighestJumpSporters: state.theHighestJumpSporters,
                        theLowestJumpSporters: state.theLowestJumpSporters,
                        allArithmeticAverage: state.allArithmeticAverage,
                        chartDataCounter: state.chartDataCounter,
                      );
                      //Pdf'i kaydetme
                      await _savePdf();

                      //Oluşturduğumuz pdf'i görüntüleme
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PdfPreviewScreen(
                                    path: pdfPath,
                                  )));
                    },
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<Uint8List?> _takeScreenShoot() async {
    var screenShoot = await screenshotController.capture();

    return screenShoot;
  }

  Future _savePdf() async {
    // Directory documentDirectory = await getApplicationDocumentsDirectory();
    File file = File(pdfPath);

    file.writeAsBytesSync(await pdf.save());
  }

  _writeOnPdf({
    required List<Sporter> sporterList,
    required screenShoot,
    required List<Sporter> theHighestJumpSporters,
    required List<Sporter> theLowestJumpSporters,
    required double allArithmeticAverage,
    required int chartDataCounter,
  }) {
    // int mount = calculates.getChartData(sporterList).fold(0, (previousValue, element) => previousValue + element.mount);
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(
              level: 0,
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: <pw.Widget>[
                  pw.Text('Tüm istatistikler', textScaleFactor: 2),
                ],
              ),
            ),
            pw.Header(level: 2, text: 'En yüksek zipliyanlar'),
            pw.Paragraph(text: theHighestJumpSporters.fold('', (previousValue, element) => '$previousValue ${element.name} = ${element.highestJump} cm ')),
            pw.Header(level: 2, text: 'En Düsük zipliyanlar'),
            pw.Paragraph(text: theLowestJumpSporters.fold('', (previousValue, element) => '$previousValue ${element.name}= ${element.lowestJump} cm')),
            pw.Header(level: 2, text: 'Genel Aritmetik Ortalama'),
            pw.Paragraph(text: '${allArithmeticAverage.toStringAsFixed(2)} cm '),
            pw.Header(level: 2, text: 'Grafik'),
            pw.Paragraph(text: '''%15'den fazla olan ziplama sayisi : ${chartDataCounter.toString()}'''),
            pw.Image(
              pw.MemoryImage(
                screenShoot,
              ),
            ),
            pw.Header(
              level: 0,
              child: pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: <pw.Widget>[
                  pw.Text('Oyuncu Sonuclari', textScaleFactor: 2),
                ],
              ),
            ),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>['Oyuncu Adi', 'Kilo', 'Lewis', 'Ortalama', 'En Yüksek'],
              ..._buildRow(sporterList),
            ]),
          ];
        },
      ),
    );
  }

  _buildRow(List<Sporter> sporterList) {
    List<List<String>> tempList = [];
    for (var i = 0; i < sporterList.length; i++) {
      tempList.add(<String>[
        sporterList[i].name,
        sporterList[i].weight.toStringAsFixed(2),
        sporterList[i].lewisPower.toStringAsFixed(2),
        sporterList[i].arithmeticAverage.toStringAsFixed(2),
        sporterList[i].highestJump.toStringAsFixed(2),
      ]);
    }

    return tempList;
  }

  List<charts.Series<Chart, String>> _buildSeries({required List<Sporter> sporterList, required List<Chart> chartData}) {
    List<charts.Series<Chart, String>> series = [
      charts.Series(
        data: chartData,
        id: '',
        domainFn: (Chart chart, _) => chart.name,
        measureFn: (Chart chart, _) => chart.mount,
        colorFn: (Chart chart, _) => charts.ColorUtil.fromDartColor(chart.barColor),
      ),
    ];

    return series;
  }
}
