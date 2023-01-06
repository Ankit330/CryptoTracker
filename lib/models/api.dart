// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static Future<List<dynamic>> getMarkets() async {
    try {
      Uri requestPath = Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=30&page=1&sparkline=false");
      var response = await http.get(requestPath);
      var decodedResponse = json.decode(response.body);

      List<dynamic> markets = (decodedResponse.toList() as List<dynamic>);

      return markets;
    } catch (ex) {
      print(ex.toString());
      return [];
    }
  }

  static Future<List<dynamic>> fetchPrices(String id) async {
    try {
      Uri req = Uri.parse(
          "https://api.coingecko.com/api/v3/coins/$id/market_chart?vs_currency=inr&days=7");
      final response = await http.get(req);
      var decodeResponse = json.decode(response.body);
      List<dynamic> prices = decodeResponse['prices'] as List<dynamic>;
      return prices;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
