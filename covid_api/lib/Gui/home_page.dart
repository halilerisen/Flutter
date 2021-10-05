import 'package:covid_api/services/covid_api_service.dart';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:covid_api/models/built_covid_data.dart';
import 'package:provider/src/provider.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String countryName = '';

  Future<Response<BuiltCovidData>> getCovidData(BuildContext context) async {
    var data = await context
        .read<CovidApiService>()
        .getCovidStatistics(country: countryName);
    return data;
  }

  var data;

  @override
  void initState() {
    super.initState();
    data = getCovidData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<Response<BuiltCovidData>>(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final covidData = snapshot.data!.body!;

              return _builtCovidCard(covidData);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Padding _builtCovidCard(BuiltCovidData covidData) {
    var covidResponse = covidData.response![0];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 500,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  countryName = value;
                });
              },
              decoration: InputDecoration(
                  suffix: ElevatedButton(
                    child: const Icon(Icons.get_app),
                    onPressed: () {
                      setState(() {
                        data = getCovidData(context);
                      });
                    },
                  ),
                  hintText: 'Enter country',
                  hintStyle: const TextStyle(color: Colors.grey),
                  constraints: const BoxConstraints(
                    minWidth: 300,
                  )),
              autofocus: true,
            ),
            const SizedBox(
              height: 50,
            ),
            _builtTitleText(
              title: '${covidResponse.country}, ${covidResponse.continent}',
              fontSize: 50,
            ),
            const SizedBox(
              height: 15,
            ),
            _builtTitleText(
              title: 'Date : ${covidResponse.day}',
              fontSize: 25,
            ),
            _builtInfoText(
              valueName: 'Population',
              value: NumberFormat.decimalPattern()
                  .format(covidResponse.population),
              color: Colors.green,
            ),
            _builtInfoText(
              valueName: 'New Cases',
              value: covidResponse.cases!.aNew.toString(),
              color: Colors.blue,
            ),
            _builtInfoText(
              valueName: 'Active Cases',
              value: covidResponse.cases!.active.toString(),
              color: Colors.blue,
            ),
            _builtInfoText(
              valueName: 'Critical Cases',
              value: covidResponse.cases!.critical.toString(),
              color: Colors.blue,
            ),
            _builtInfoText(
              valueName: 'Recovered Cases',
              value: covidResponse.cases!.recovered.toString(),
              color: Colors.blue,
            ),
            _builtInfoText(
              valueName: '1M_pop Case',
              value: covidResponse.cases!.a1M_pop.toString(),
              color: Colors.blue,
            ),
            _builtInfoText(
              valueName: 'Total Cases',
              value: covidResponse.cases!.total.toString(),
              color: Colors.blue,
            ),
            _builtInfoText(
              valueName: 'New Deaths',
              value: covidResponse.deaths!.aNew.toString(),
              color: Colors.red,
            ),
            _builtInfoText(
              valueName: '1M_pop Deaths',
              value: covidResponse.deaths!.a1M_pop.toString(),
              color: Colors.red,
            ),
            _builtInfoText(
              valueName: 'Total Deaths',
              value: covidResponse.deaths!.total.toString(),
              color: Colors.red,
            ),
            _builtInfoText(
              valueName: '1M_pop Tests',
              value: covidResponse.tests!.a1M_pop.toString(),
              color: Colors.yellow,
            ),
            _builtInfoText(
              valueName: 'Total Tests',
              value: covidResponse.tests!.total.toString(),
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }

  Widget _builtTitleText({required String title, required double fontSize}) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _builtInfoText({
    required String? valueName,
    required String? value,
    Color? color,
  }) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$valueName : $value',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
