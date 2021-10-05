library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:covid_api/models/built_covid_data.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

@SerializersFor([
  BuiltCovidData,
  CovidResponse,
  CovidResponseCases,
  CovidResponseDeaths,
  CovidResponseTests,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
