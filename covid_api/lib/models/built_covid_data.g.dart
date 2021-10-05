// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_vehicle;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltCovidData> _$builtCovidDataSerializer =
    new _$BuiltCovidDataSerializer();
Serializer<CovidResponse> _$covidResponseSerializer =
    new _$CovidResponseSerializer();
Serializer<CovidResponseCases> _$covidResponseCasesSerializer =
    new _$CovidResponseCasesSerializer();
Serializer<CovidResponseDeaths> _$covidResponseDeathsSerializer =
    new _$CovidResponseDeathsSerializer();
Serializer<CovidResponseTests> _$covidResponseTestsSerializer =
    new _$CovidResponseTestsSerializer();

class _$BuiltCovidDataSerializer
    implements StructuredSerializer<BuiltCovidData> {
  @override
  final Iterable<Type> types = const [BuiltCovidData, _$BuiltCovidData];
  @override
  final String wireName = 'BuiltCovidData';

  @override
  Iterable<Object?> serialize(Serializers serializers, BuiltCovidData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.response;
    if (value != null) {
      result
        ..add('response')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(CovidResponse)])));
    }
    return result;
  }

  @override
  BuiltCovidData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltCovidDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'response':
          result.response.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CovidResponse)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$CovidResponseSerializer implements StructuredSerializer<CovidResponse> {
  @override
  final Iterable<Type> types = const [CovidResponse, _$CovidResponse];
  @override
  final String wireName = 'CovidResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, CovidResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.continent;
    if (value != null) {
      result
        ..add('continent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.population;
    if (value != null) {
      result
        ..add('population')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.cases;
    if (value != null) {
      result
        ..add('cases')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CovidResponseCases)));
    }
    value = object.deaths;
    if (value != null) {
      result
        ..add('deaths')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CovidResponseDeaths)));
    }
    value = object.tests;
    if (value != null) {
      result
        ..add('tests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(CovidResponseTests)));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CovidResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CovidResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'continent':
          result.continent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'population':
          result.population = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cases':
          result.cases.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CovidResponseCases))!
              as CovidResponseCases);
          break;
        case 'deaths':
          result.deaths.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CovidResponseDeaths))!
              as CovidResponseDeaths);
          break;
        case 'tests':
          result.tests.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CovidResponseTests))!
              as CovidResponseTests);
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CovidResponseCasesSerializer
    implements StructuredSerializer<CovidResponseCases> {
  @override
  final Iterable<Type> types = const [CovidResponseCases, _$CovidResponseCases];
  @override
  final String wireName = 'CovidResponseCases';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CovidResponseCases object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.aNew;
    if (value != null) {
      result
        ..add('aNew')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.critical;
    if (value != null) {
      result
        ..add('critical')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.recovered;
    if (value != null) {
      result
        ..add('recovered')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.a1M_pop;
    if (value != null) {
      result
        ..add('a1M_pop')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CovidResponseCases deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CovidResponseCasesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'aNew':
          result.aNew = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'critical':
          result.critical = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'recovered':
          result.recovered = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'a1M_pop':
          result.a1M_pop = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$CovidResponseDeathsSerializer
    implements StructuredSerializer<CovidResponseDeaths> {
  @override
  final Iterable<Type> types = const [
    CovidResponseDeaths,
    _$CovidResponseDeaths
  ];
  @override
  final String wireName = 'CovidResponseDeaths';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CovidResponseDeaths object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.aNew;
    if (value != null) {
      result
        ..add('aNew')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.a1M_pop;
    if (value != null) {
      result
        ..add('a1M_pop')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CovidResponseDeaths deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CovidResponseDeathsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'aNew':
          result.aNew = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'a1M_pop':
          result.a1M_pop = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$CovidResponseTestsSerializer
    implements StructuredSerializer<CovidResponseTests> {
  @override
  final Iterable<Type> types = const [CovidResponseTests, _$CovidResponseTests];
  @override
  final String wireName = 'CovidResponseTests';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CovidResponseTests object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.a1M_pop;
    if (value != null) {
      result
        ..add('a1M_pop')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.total;
    if (value != null) {
      result
        ..add('total')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CovidResponseTests deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CovidResponseTestsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'a1M_pop':
          result.a1M_pop = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltCovidData extends BuiltCovidData {
  @override
  final BuiltList<CovidResponse>? response;

  factory _$BuiltCovidData([void Function(BuiltCovidDataBuilder)? updates]) =>
      (new BuiltCovidDataBuilder()..update(updates)).build();

  _$BuiltCovidData._({this.response}) : super._();

  @override
  BuiltCovidData rebuild(void Function(BuiltCovidDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltCovidDataBuilder toBuilder() =>
      new BuiltCovidDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltCovidData && response == other.response;
  }

  @override
  int get hashCode {
    return $jf($jc(0, response.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltCovidData')
          ..add('response', response))
        .toString();
  }
}

class BuiltCovidDataBuilder
    implements Builder<BuiltCovidData, BuiltCovidDataBuilder> {
  _$BuiltCovidData? _$v;

  ListBuilder<CovidResponse>? _response;
  ListBuilder<CovidResponse> get response =>
      _$this._response ??= new ListBuilder<CovidResponse>();
  set response(ListBuilder<CovidResponse>? response) =>
      _$this._response = response;

  BuiltCovidDataBuilder();

  BuiltCovidDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _response = $v.response?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltCovidData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BuiltCovidData;
  }

  @override
  void update(void Function(BuiltCovidDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltCovidData build() {
    _$BuiltCovidData _$result;
    try {
      _$result = _$v ?? new _$BuiltCovidData._(response: _response?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'response';
        _response?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BuiltCovidData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CovidResponse extends CovidResponse {
  @override
  final String? continent;
  @override
  final String? country;
  @override
  final int? population;
  @override
  final CovidResponseCases? cases;
  @override
  final CovidResponseDeaths? deaths;
  @override
  final CovidResponseTests? tests;
  @override
  final String? day;
  @override
  final String? time;

  factory _$CovidResponse([void Function(CovidResponseBuilder)? updates]) =>
      (new CovidResponseBuilder()..update(updates)).build();

  _$CovidResponse._(
      {this.continent,
      this.country,
      this.population,
      this.cases,
      this.deaths,
      this.tests,
      this.day,
      this.time})
      : super._();

  @override
  CovidResponse rebuild(void Function(CovidResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CovidResponseBuilder toBuilder() => new CovidResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CovidResponse &&
        continent == other.continent &&
        country == other.country &&
        population == other.population &&
        cases == other.cases &&
        deaths == other.deaths &&
        tests == other.tests &&
        day == other.day &&
        time == other.time;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, continent.hashCode), country.hashCode),
                            population.hashCode),
                        cases.hashCode),
                    deaths.hashCode),
                tests.hashCode),
            day.hashCode),
        time.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CovidResponse')
          ..add('continent', continent)
          ..add('country', country)
          ..add('population', population)
          ..add('cases', cases)
          ..add('deaths', deaths)
          ..add('tests', tests)
          ..add('day', day)
          ..add('time', time))
        .toString();
  }
}

class CovidResponseBuilder
    implements Builder<CovidResponse, CovidResponseBuilder> {
  _$CovidResponse? _$v;

  String? _continent;
  String? get continent => _$this._continent;
  set continent(String? continent) => _$this._continent = continent;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  int? _population;
  int? get population => _$this._population;
  set population(int? population) => _$this._population = population;

  CovidResponseCasesBuilder? _cases;
  CovidResponseCasesBuilder get cases =>
      _$this._cases ??= new CovidResponseCasesBuilder();
  set cases(CovidResponseCasesBuilder? cases) => _$this._cases = cases;

  CovidResponseDeathsBuilder? _deaths;
  CovidResponseDeathsBuilder get deaths =>
      _$this._deaths ??= new CovidResponseDeathsBuilder();
  set deaths(CovidResponseDeathsBuilder? deaths) => _$this._deaths = deaths;

  CovidResponseTestsBuilder? _tests;
  CovidResponseTestsBuilder get tests =>
      _$this._tests ??= new CovidResponseTestsBuilder();
  set tests(CovidResponseTestsBuilder? tests) => _$this._tests = tests;

  String? _day;
  String? get day => _$this._day;
  set day(String? day) => _$this._day = day;

  String? _time;
  String? get time => _$this._time;
  set time(String? time) => _$this._time = time;

  CovidResponseBuilder();

  CovidResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _continent = $v.continent;
      _country = $v.country;
      _population = $v.population;
      _cases = $v.cases?.toBuilder();
      _deaths = $v.deaths?.toBuilder();
      _tests = $v.tests?.toBuilder();
      _day = $v.day;
      _time = $v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CovidResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CovidResponse;
  }

  @override
  void update(void Function(CovidResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CovidResponse build() {
    _$CovidResponse _$result;
    try {
      _$result = _$v ??
          new _$CovidResponse._(
              continent: continent,
              country: country,
              population: population,
              cases: _cases?.build(),
              deaths: _deaths?.build(),
              tests: _tests?.build(),
              day: day,
              time: time);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cases';
        _cases?.build();
        _$failedField = 'deaths';
        _deaths?.build();
        _$failedField = 'tests';
        _tests?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CovidResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CovidResponseCases extends CovidResponseCases {
  @override
  final String? aNew;
  @override
  final int? active;
  @override
  final int? critical;
  @override
  final int? recovered;
  @override
  final String? a1M_pop;
  @override
  final int? total;

  factory _$CovidResponseCases(
          [void Function(CovidResponseCasesBuilder)? updates]) =>
      (new CovidResponseCasesBuilder()..update(updates)).build();

  _$CovidResponseCases._(
      {this.aNew,
      this.active,
      this.critical,
      this.recovered,
      this.a1M_pop,
      this.total})
      : super._();

  @override
  CovidResponseCases rebuild(
          void Function(CovidResponseCasesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CovidResponseCasesBuilder toBuilder() =>
      new CovidResponseCasesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CovidResponseCases &&
        aNew == other.aNew &&
        active == other.active &&
        critical == other.critical &&
        recovered == other.recovered &&
        a1M_pop == other.a1M_pop &&
        total == other.total;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, aNew.hashCode), active.hashCode),
                    critical.hashCode),
                recovered.hashCode),
            a1M_pop.hashCode),
        total.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CovidResponseCases')
          ..add('aNew', aNew)
          ..add('active', active)
          ..add('critical', critical)
          ..add('recovered', recovered)
          ..add('a1M_pop', a1M_pop)
          ..add('total', total))
        .toString();
  }
}

class CovidResponseCasesBuilder
    implements Builder<CovidResponseCases, CovidResponseCasesBuilder> {
  _$CovidResponseCases? _$v;

  String? _aNew;
  String? get aNew => _$this._aNew;
  set aNew(String? aNew) => _$this._aNew = aNew;

  int? _active;
  int? get active => _$this._active;
  set active(int? active) => _$this._active = active;

  int? _critical;
  int? get critical => _$this._critical;
  set critical(int? critical) => _$this._critical = critical;

  int? _recovered;
  int? get recovered => _$this._recovered;
  set recovered(int? recovered) => _$this._recovered = recovered;

  String? _a1M_pop;
  String? get a1M_pop => _$this._a1M_pop;
  set a1M_pop(String? a1M_pop) => _$this._a1M_pop = a1M_pop;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  CovidResponseCasesBuilder();

  CovidResponseCasesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _aNew = $v.aNew;
      _active = $v.active;
      _critical = $v.critical;
      _recovered = $v.recovered;
      _a1M_pop = $v.a1M_pop;
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CovidResponseCases other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CovidResponseCases;
  }

  @override
  void update(void Function(CovidResponseCasesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CovidResponseCases build() {
    final _$result = _$v ??
        new _$CovidResponseCases._(
            aNew: aNew,
            active: active,
            critical: critical,
            recovered: recovered,
            a1M_pop: a1M_pop,
            total: total);
    replace(_$result);
    return _$result;
  }
}

class _$CovidResponseDeaths extends CovidResponseDeaths {
  @override
  final String? aNew;
  @override
  final String? a1M_pop;
  @override
  final int? total;

  factory _$CovidResponseDeaths(
          [void Function(CovidResponseDeathsBuilder)? updates]) =>
      (new CovidResponseDeathsBuilder()..update(updates)).build();

  _$CovidResponseDeaths._({this.aNew, this.a1M_pop, this.total}) : super._();

  @override
  CovidResponseDeaths rebuild(
          void Function(CovidResponseDeathsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CovidResponseDeathsBuilder toBuilder() =>
      new CovidResponseDeathsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CovidResponseDeaths &&
        aNew == other.aNew &&
        a1M_pop == other.a1M_pop &&
        total == other.total;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, aNew.hashCode), a1M_pop.hashCode), total.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CovidResponseDeaths')
          ..add('aNew', aNew)
          ..add('a1M_pop', a1M_pop)
          ..add('total', total))
        .toString();
  }
}

class CovidResponseDeathsBuilder
    implements Builder<CovidResponseDeaths, CovidResponseDeathsBuilder> {
  _$CovidResponseDeaths? _$v;

  String? _aNew;
  String? get aNew => _$this._aNew;
  set aNew(String? aNew) => _$this._aNew = aNew;

  String? _a1M_pop;
  String? get a1M_pop => _$this._a1M_pop;
  set a1M_pop(String? a1M_pop) => _$this._a1M_pop = a1M_pop;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  CovidResponseDeathsBuilder();

  CovidResponseDeathsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _aNew = $v.aNew;
      _a1M_pop = $v.a1M_pop;
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CovidResponseDeaths other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CovidResponseDeaths;
  }

  @override
  void update(void Function(CovidResponseDeathsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CovidResponseDeaths build() {
    final _$result = _$v ??
        new _$CovidResponseDeaths._(aNew: aNew, a1M_pop: a1M_pop, total: total);
    replace(_$result);
    return _$result;
  }
}

class _$CovidResponseTests extends CovidResponseTests {
  @override
  final String? a1M_pop;
  @override
  final int? total;

  factory _$CovidResponseTests(
          [void Function(CovidResponseTestsBuilder)? updates]) =>
      (new CovidResponseTestsBuilder()..update(updates)).build();

  _$CovidResponseTests._({this.a1M_pop, this.total}) : super._();

  @override
  CovidResponseTests rebuild(
          void Function(CovidResponseTestsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CovidResponseTestsBuilder toBuilder() =>
      new CovidResponseTestsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CovidResponseTests &&
        a1M_pop == other.a1M_pop &&
        total == other.total;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, a1M_pop.hashCode), total.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CovidResponseTests')
          ..add('a1M_pop', a1M_pop)
          ..add('total', total))
        .toString();
  }
}

class CovidResponseTestsBuilder
    implements Builder<CovidResponseTests, CovidResponseTestsBuilder> {
  _$CovidResponseTests? _$v;

  String? _a1M_pop;
  String? get a1M_pop => _$this._a1M_pop;
  set a1M_pop(String? a1M_pop) => _$this._a1M_pop = a1M_pop;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  CovidResponseTestsBuilder();

  CovidResponseTestsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _a1M_pop = $v.a1M_pop;
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CovidResponseTests other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CovidResponseTests;
  }

  @override
  void update(void Function(CovidResponseTestsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CovidResponseTests build() {
    final _$result =
        _$v ?? new _$CovidResponseTests._(a1M_pop: a1M_pop, total: total);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
