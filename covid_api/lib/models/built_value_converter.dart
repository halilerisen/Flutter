import 'package:chopper/chopper.dart';
import 'package:covid_api/models/serializers.dart';
import 'package:built_collection/built_collection.dart';

class BuiltValueConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    return super.convertRequest(
      request.copyWith(
        body: serializers.serializeWith(
          // Since convertRequest doesn't have a type parameter, Serializer's type will be determined at runtime
          serializers.serializerForType(request.body.runtimeType)!,
          request.body,
        ),
      ),
    );
  }

  @override
  Response<BodyType> convertResponse<BodyType, SingleItemType>(
      Response response) {
    final Response dynamicResponse = super.convertResponse(response);

    dynamicResponse.body['response'][0]['cases']['aNew'] =
        dynamicResponse.body['response'][0]['cases']['new'];
    dynamicResponse.body['response'][0]['cases']['a1M_pop'] =
        dynamicResponse.body['response'][0]['cases']['1M_pop'];

    dynamicResponse.body['response'][0]['deaths']['aNew'] =
        dynamicResponse.body['response'][0]['deaths']['new'];
    dynamicResponse.body['response'][0]['deaths']['a1M_pop'] =
        dynamicResponse.body['response'][0]['deaths']['1M_pop'];

    dynamicResponse.body['response'][0]['tests']['a1M_pop'] =
        dynamicResponse.body['response'][0]['tests']['1M_pop'];

    final BodyType customBody =
        _convertToCustomObject<SingleItemType>(dynamicResponse.body);

    return dynamicResponse.copyWith<BodyType>(body: customBody);
  }

  dynamic _convertToCustomObject<SingleItemType>(dynamic element) {
    if (element is SingleItemType) return element;

    if (element is List) {
      return _deserializeerListOf<SingleItemType>(element);
    } else {
      return _deserialize<SingleItemType>(element);
    }
  }

  BuiltList<SingleItemType> _deserializeerListOf<SingleItemType>(
    List dynamicList,
  ) {
    return BuiltList<SingleItemType>(
      dynamicList.map((e) => _deserialize<SingleItemType>(e)),
    );
  }

  SingleItemType _deserialize<SingleItemType>(
    Map<String, dynamic> value,
  ) {
    return serializers.deserializeWith(
        serializers.serializerForType(SingleItemType)!, value);
  }
}
