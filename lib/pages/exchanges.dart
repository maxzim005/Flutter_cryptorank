import 'package:flutter/material.dart';
import 'package:flutter_todo/api/api_request.dart';
import 'package:flutter_todo/classes/exchangeClass.dart';

void main() => runApp(const ExchangesPage());

class ExchangesPage extends StatefulWidget {
  const ExchangesPage({super.key});

  @override
  State<ExchangesPage> createState() => _ExchangesPageState();
}

class _ExchangesPageState extends State<ExchangesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: const Text(
              'Exchanges, sorted by its value for 24 hours in USD',
              style: TextStyle(fontSize: 30)),
        ),
        body: Center(
          child: FutureBuilder<List<Exchange>>(
            future: fetchExchanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 70,
                            width: 600,
                            child: Card(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 7.0, 0, 0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          const Text('Name of exchange',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Text('${snapshot.data![index].name}',
                                              style: const TextStyle(fontSize: 20)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text('Value for 24h in USD',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Text('${snapshot.data![index].values.usd.volume24h}',
                                              style: const TextStyle(fontSize: 20)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
