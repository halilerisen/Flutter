import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  late String url;

  NetworkHelper({required this.url});

  Future getData() async {
    Uri uri = Uri.parse(url);

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      var source = convert.jsonDecode(data);

      return source;
    } else
      print(response.statusCode);
  }
}
