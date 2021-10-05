library built_vehicle;

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

part 'built_covid_data.g.dart';

abstract class BuiltCovidData
    implements Built<BuiltCovidData, BuiltCovidDataBuilder> {
  BuiltList<CovidResponse>? get response;

  BuiltCovidData._();

  factory BuiltCovidData([updates(BuiltCovidDataBuilder b)]) = _$BuiltCovidData;

  static Serializer<BuiltCovidData> get serializer =>
      _$builtCovidDataSerializer;
}

abstract class CovidResponse
    implements Built<CovidResponse, CovidResponseBuilder> {
  String? get continent;
  String? get country;
  int? get population;
  CovidResponseCases? get cases;
  CovidResponseDeaths? get deaths;
  CovidResponseTests? get tests;
  String? get day;
  String? get time;

  CovidResponse._();

  factory CovidResponse([updates(CovidResponseBuilder b)]) = _$CovidResponse;

  static Serializer<CovidResponse> get serializer => _$covidResponseSerializer;
}

abstract class CovidResponseCases
    implements Built<CovidResponseCases, CovidResponseCasesBuilder> {
  String? get aNew;
  int? get active;
  int? get critical;
  int? get recovered;
  String? get a1M_pop;
  int? get total;

  CovidResponseCases._();

  factory CovidResponseCases([updates(CovidResponseCasesBuilder b)]) =
      _$CovidResponseCases;

  static Serializer<CovidResponseCases> get serializer =>
      _$covidResponseCasesSerializer;
}

abstract class CovidResponseDeaths
    implements Built<CovidResponseDeaths, CovidResponseDeathsBuilder> {
  String? get aNew;
  String? get a1M_pop;
  int? get total;

  CovidResponseDeaths._();

  factory CovidResponseDeaths([updates(CovidResponseDeathsBuilder b)]) =
      _$CovidResponseDeaths;

  static Serializer<CovidResponseDeaths> get serializer =>
      _$covidResponseDeathsSerializer;
}

abstract class CovidResponseTests
    implements Built<CovidResponseTests, CovidResponseTestsBuilder> {
  String? get a1M_pop;
  int? get total;

  CovidResponseTests._();

  factory CovidResponseTests([updates(CovidResponseTestsBuilder b)]) =
      _$CovidResponseTests;

  static Serializer<CovidResponseTests> get serializer =>
      _$covidResponseTestsSerializer;
}
