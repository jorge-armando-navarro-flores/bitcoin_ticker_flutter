import 'package:http/http.dart' as http;
import 'dart:convert';
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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate/BTC/';
const apiKey = '28F25363-9312-4829-AE60-5C166334C203';

class CoinData {

  Future getCoinData(String currency) async{
    var url = Uri.parse("$coinAPIURL$currency?apikey=$apiKey");
    http.Response response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    //TODO validate status
    if(response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);
    } else{
      print(response.statusCode);
    }
    //TODO Json decode
  }
}
