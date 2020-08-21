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

class CoinData {

    Future getCoinData() async {
      String requestURL = '$url/BTC/USD?apikey=$apiKey';
      http.Response response = await http.get(requestURL);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['rate'];
        return lastPrice;
      } else {
        print(response.statusCode);
        throw 'Problem with get request.';
      }
    }
  }

const apiKey = '87A0DCBC-4D83-4688-AC20-13239F832BA6';

const url = 'https://rest.coinapi.io/v1/exchangerate';


//$exchangeRate/$cryptoList/$currenciesList