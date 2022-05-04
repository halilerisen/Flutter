import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/model_word_explanation.dart';

class ServiceDioClient {
  final Dio dio = Dio();

  final String _baseUrl = dotenv.env['URL'].toString();

  Future<dynamic> getWordExplanation({required String word}) async {
    try {
      final Response<Map<String, dynamic>> res = await dio.get<Map<String, dynamic>>(
        _baseUrl,
        queryParameters: <String, dynamic>{'term': word},
        options: Options(
          headers: <String, dynamic>{
            'X-RapidAPI-Host': dotenv.env['X-RapidAPI-Host'],
            'X-RapidAPI-Key': dotenv.env['X-RapidAPI-Key'],
          },
        ),
      );

      return ModelWordResponse.fromJson(res.data!);
    } on DioError catch (e) {
      if (e.response != null) {
        log('-----DIO ERROR-----');
        log(e.message);
        log('STATUS: ${e.response?.statusCode}');
        log('DATA: ${e.response?.data}');
        log('HEADERS: ${e.response?.headers}');
      } else {
        log('Error sending request!');
        log(e.message);
      }

      return e.message;
    } catch (e) {
      log('$e');
    }
  }
}
