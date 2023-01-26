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
    // print(response.body[0]);
    return ExchangesList.fromJson(jsonDecode(response.body)['data']);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
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

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

class Exchange{
  final String id;
  final String title;
  // final String url;

  const Exchange({
    required this.id,
    // this.url,
    required this.title,
  }) ;

  factory Exchange.fromJson(Map<String, dynamic> json){
    return Exchange(
      id: json['id'].toString(),
      title: json['name'],
      // url: json['json'],
    );
  }
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
///////////////////
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
                print('HOORAY!!!');
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: 5, //change later
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        // color: Colors.amber[colorCodes[index]],
                        child: Center(child: Text(' ${snapshot.data!.exchanges[index].title} +  ${snapshot.data!.exchanges[index].id}/// ')),
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