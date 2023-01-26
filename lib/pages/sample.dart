import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<ExchangesList> fetchExchanges() async {
  final response = await http
      .get(Uri.parse('https://api.cryptorank.io/v1/exchanges?api_key=d34b2ac89d084e76da11d2dbf197d90e2e1f5f9aac355a6e6a9d9364fd4f'));

  if (response.statusCode == 200) {
    // var smth = jsonDecode(response.body)['data'];
    // print(smth);
    // final List<dynamic> dataList = jsonDecode(response.body)['data'];
    // final item = dataList[0];
    // final values = item.values;
    // print(item['values'].values);
    // item['values'].values.USD.forEach((v) => print('${v}'));
    // print(values.USD);
    // print(response.body[0]);
    // var smth = jsonDecode(response.body)['data'];
    // var qwqwt = smth[0].values.USD.volume24h;
    // print('${qwqwt}');
    // var sorted = smth.sort((e1, e2) => e1.values.usd.volume24h.compareTo(e2.values.usd.volume24h));
    // print(sorted);
    // return ExchangesList.fromJson(sorted);
    return ExchangesList.fromJson(jsonDecode(response.body)['data']);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
///////////////////
// Future<ExchangesList> sortByVolume24h(Future<ExchangesList> exchanges) {
//
//   Future<ExchangesList> sortedByVolume24h;
//   return sortedByVolume24h;
// }
///////////////////
class ExchangesList {
  final List<Exchange> exchanges;

  const ExchangesList({
    required this.exchanges,
  });

  factory ExchangesList.fromJson(List<dynamic> parsedJson) {

    List<Exchange> exchanges = <Exchange>[];
    exchanges = parsedJson.map( (i) => Exchange.fromJson(i) ).toList();

    return ExchangesList(
        exchanges: exchanges,
    );
  }
}

class Exchange{
  final String id;
  final String name;
  final Values values;
  // final String url;

  const Exchange({
    required this.id,
    // this.url,
    required this.name,
    required this.values
  }) ;

  factory Exchange.fromJson(Map<String, dynamic> json){
    return Exchange(
      id: json['id'].toString(),
      name: json['name'],
      values: Values.fromJSON(json['values']),
      // url: json['json'],
    );
  }
}

class Values {
  final USD usd;

  const Values({
    required this.usd,
});

  factory Values.fromJSON(Map<String, dynamic> json){
    return Values(
      usd: USD.fromJSON(json['USD']),
    );
  }
}

class USD {
  final String volume24h;
  final String volume7d;
  final String volume30d;

  const USD({
    required this.volume24h,
    required this.volume7d,
    required this.volume30d,
});

  factory USD.fromJSON(Map<String, dynamic> json){
    return USD(
      volume24h: json['volume24h'].toString(),
      volume7d: json['volume7d'].toString(),
      volume30d: json['volume30d'].toString(),
    );
  }
}
/////////////////// BACK HERE ////////
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<ExchangesList> exchangesList;

  @override
  void initState() {
    super.initState();
    exchangesList = fetchExchanges();
    // print(exchangesList.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<ExchangesList>(
            future: exchangesList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // print('HOORAY!!!');
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: 5, //change later
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        // color: Colors.amber[colorCodes[index]],
                        child: Center(child: Text(' ${snapshot.data!.exchanges[index].name} +  ${snapshot.data!.exchanges[index].values.usd.volume24h}/// ')),
                      );
                    }
                );
                // return Text(snapshot.data!.exchanges);
              } else if (snapshot.hasError) {
                print('snapshot error');
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}