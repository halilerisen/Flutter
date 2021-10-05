// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CovidApiService extends CovidApiService {
  _$CovidApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CovidApiService;

  @override
  Future<Response<BuiltCovidData>> getCovidStatistics({String? country}) {
    final $url = '';
    final $params = <String, dynamic>{'country': country};
    final $headers = {
      'x-rapidapi-host': 'covid-193.p.rapidapi.com',
      'x-rapidapi-key': '085bc231c9mshb5a2673f54bd6dbp130075jsnf44243efd4be',
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<BuiltCovidData, BuiltCovidData>($request);
  }
}
