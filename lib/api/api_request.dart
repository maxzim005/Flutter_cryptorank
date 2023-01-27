import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_todo/classes/exchangeClass.dart';

Future<List<Exchange>> fetchExchanges() async {
  List<Exchange> exchanges = [];
  final response = await http
      .get(Uri.parse(
      'https://api.cryptorank.io/v1/exchanges?api_key=d34b2ac89d084e76da11d2dbf197d90e2e1f5f9aac355a6e6a9d9364fd4f'));

  if (response.statusCode == 200) {
    var exchangesJSON = jsonDecode(response.body)['data'];
    for (int i = 0; i < exchangesJSON.length; i++) {
      exchanges.add(Exchange.fromJson(exchangesJSON[i]));
    }
    exchanges.sort((a, b) =>
        b.values.usd.volume24h.compareTo(a.values.usd.volume24h));
    return exchanges;
  } else {
    throw Exception('Failed to load album');
  }
}
