import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD';
  String exchangeRate = '?';
  String crypto = 'BTC';
  int i;

  CupertinoPicker getPickerItems() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      Text(currency);
      pickerItems.add(Text(currency));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];

        getData();
      },
      children: pickerItems,
    );
  }

  void getData() async {
    try {
      double data = await CoinData().getCoinData(selectedCurrency, crypto);
      setState(() {
        exchangeRate = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  List <Widget> cryptoCurrency() {
    List cards = new List <Widget> ();
    for (i =0; i< 3 ; i++) {
      crypto = cryptoList[i];
      cards.add(
        Card(
          color: Color(0xFFbec9ed),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $crypto = $exchangeRate $selectedCurrency',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } cards.add(
    Container(
      height: 150.0,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 30.0),
      color: Color(0xFFbec9ed),
      child: getPickerItems(),
    ),);
    return cards;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: cryptoCurrency(),
      ),
    );
  }
}
