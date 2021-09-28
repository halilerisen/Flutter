import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const List<String> kCurrenciesList = [
  'SHIB',
  'DOGE',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> kCryptoList = [
  'USD',
  'TL',
  'EUR',
];

const String _coinAPIUrl = "https://rest.coinapi.io/v1/exchangerate";


const String _apiKey = "Your-Api-Key";

class CoinData {
  Future getCoinData({required String selectedCurrency}) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in kCryptoList) {
      String url = '$_coinAPIUrl/$selectedCurrency/$crypto?apikey=$_apiKey';
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        //Bağlantı kaynak kodu
        var decodedData = convert.jsonDecode(response.body);
        double lastPrice = decodedData['rate'];

        cryptoPrices[crypto] = lastPrice.toStringAsFixed(8);
      } else
        print(response.statusCode);
    }

    return cryptoPrices;
  }
}
