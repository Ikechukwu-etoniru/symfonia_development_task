import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/models/crypto.dart';

class CryptoDataProvider with ChangeNotifier {
  final List<Crypto> _cryptoList = [];

  List<Crypto> get cryptoList {
    return [..._cryptoList];
  }

//  Helper variable to check internet connection
  var internet = true;
//  Helper function to check internet connection
  Future<bool> _checkInternetConnection() async {
    late bool connectStatus;
    try {
      final response = await InternetAddress.lookup('www.kindacode.com');
      if (response.isNotEmpty) {
        connectStatus = true;
      }
      // ignore: unused_catch_clause
    } on SocketException catch (err) {
      connectStatus = false;
    }
    return connectStatus;
  }

  // Function to fetch data from Coingecko api
  Future<void> fetchCryptoData() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

    final internetStatus = await _checkInternetConnection();

    if (internetStatus) {
      // Helper variable to show there is internet connection
      internet = true;
      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final values = json.decode(response.body) as List<dynamic>;
        for (var element in values) {
          // Adding data from api to _cryptoList
          _cryptoList.add(
            Crypto(
                id: element['id'],
                price: double.parse(element['current_price'].toString()),
                title: element['name'],
                imageUrl: element['image'],
                marketCap: element['market_cap'],
                rank: element['market_cap_rank'],
                percentChangein24hrs: double.parse(
                    element['price_change_percentage_24h'].toString())),
          );
        }
      } else {
        throw Exception('Failed to load Coins');
      }
    } else {
      // Helper variable to show no internet connection error
      internet = false;
    }

    notifyListeners();
  }
}
