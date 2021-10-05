import 'package:chopper/chopper.dart';
import 'package:covid_api/models/built_covid_data.dart';
import 'package:covid_api/models/built_value_converter.dart';

part 'covid_api_service.chopper.dart';

//6- baseUrl ortak path kısım
@ChopperApi(baseUrl: '')
abstract class CovidApiService extends ChopperService {
  @Get(headers: {
    'x-rapidapi-host': 'covid-193.p.rapidapi.com',
    'x-rapidapi-key': '085bc231c9mshb5a2673f54bd6dbp130075jsnf44243efd4be',
  })
  Future<Response<BuiltCovidData>> getCovidStatistics(
      {@Query('country') String country});

  static CovidApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://covid-193.p.rapidapi.com/statistics',
      services: [
        _$CovidApiService(),
      ],
      converter: BuiltValueConverter(),
      errorConverter: JsonConverter(),
    );
    return _$CovidApiService(client);
  }
}
