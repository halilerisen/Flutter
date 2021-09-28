// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'SHIB';

  late Map cryptoValues = {};
  bool isWaiting = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    isWaiting = true;
    try {
      var data =
          await CoinData().getCoinData(selectedCurrency: selectedCurrency);
      isWaiting = false;
      setState(() {
        cryptoValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CryptoCard(
                baseCurrency: selectedCurrency,
                selectedCurrency: 'USD',
                coinValue: isWaiting ? '?' : cryptoValues['USD'],
              ),
              CryptoCard(
                baseCurrency: selectedCurrency,
                selectedCurrency: 'TL',
                coinValue: isWaiting ? '?' : cryptoValues['TL'] ?? '?',
              ),
              CryptoCard(
                baseCurrency: selectedCurrency,
                selectedCurrency: 'EUR',
                coinValue: isWaiting ? '?' : cryptoValues['EUR'] ?? '?',
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }

  DropdownButton<String> getAndroidDropdownButton() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in kCurrenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value as String;

          getData();
        });
      },
    );
  }

  CupertinoPicker getIOSPicker() {
    List<Text> pickerItems = [];
    Text selectedCurrency;

    for (String currency in kCurrenciesList) {
      var newItem = Text(currency);
      pickerItems.add(newItem);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      children: pickerItems,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = pickerItems[selectedIndex];
        getData();
      },
    );
  }

  Widget getPicker() {
    if (kIsWeb) {
      return getAndroidDropdownButton();
    } else if (Platform.isIOS) {
      return getIOSPicker();
    } else {
      return getAndroidDropdownButton();
    }
  }
}

class CryptoCard extends StatelessWidget {
  final String baseCurrency;
  final String selectedCurrency;
  final String coinValue;

  CryptoCard({
    required this.baseCurrency,
    required this.selectedCurrency,
    required this.coinValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 28.0,
          ),
          child: Text(
            "1 $baseCurrency = $coinValue $selectedCurrency",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
