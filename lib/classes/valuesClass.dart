import 'package:flutter_todo/classes/usdClass.dart';

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