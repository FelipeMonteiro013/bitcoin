import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
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

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(selectedCurrency) async {
    String key = '54B8E07A-8C27-4292-B884-9ED0173EAC37';
    Map<String, String> cryptoPrices = {};

    for (var crypto in cryptoList) {
      var url = Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency?apikey=$key');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double price = data['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      }
    }
    return cryptoPrices;
  }
}
