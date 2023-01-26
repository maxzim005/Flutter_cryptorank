import 'dart:async';
import 'dart:convert';
import 'dart:developer'; //delete later

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<ArrayOfExchanges> fetchExchanges() async {
  final response = await http
      .get(Uri.parse('https://api.cryptorank.io/v1/exchanges?api_key=d34b2ac89d084e76da11d2dbf197d90e2e1f5f9aac355a6e6a9d9364fd4f'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // List<dynamic> parsedListJson = jsonDecode("your json string");
    // List<Item> itemsList = List<Item>.from(parsedListJson.map<Item>((dynamic i) => Item.fromJson(i)));
    inspect(jsonDecode(response.body[0]));
    return ArrayOfExchanges.fromJson(jsonDecode(response.body[0]));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class ArrayOfExchanges {
  // final List ArrayOfExchangesFromAPI;
  final String name;

  const ArrayOfExchanges({
    // required this.ArrayOfExchangesFromAPI,
    required this.name,
  });

  factory ArrayOfExchanges.fromJson(Map<String, dynamic> json) { //List???
    return ArrayOfExchanges(
      name: json['data.name'],
    );
  }
}

class Exchanges extends StatefulWidget {
  const Exchanges({Key? key}) : super(key: key);

  @override
  State<Exchanges> createState() => _ExchangesState();
}

class _ExchangesState extends State<Exchanges> {
  late Future<ArrayOfExchanges> arrayOfExchanges;

  @override
  void initState() {
    super.initState();
    arrayOfExchanges = fetchExchanges();
    // print(arrayOfExchanges);
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
          child: FutureBuilder<ArrayOfExchanges>(
            future: arrayOfExchanges,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.name);
              } else if (snapshot.hasError) {
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
