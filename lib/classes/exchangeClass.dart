import 'package:flutter_todo/classes/valuesClass.dart';

class Exchange {
  final String id;
  final String name;
  final Values values;

  const Exchange({
    required this.id,
    required this.name,
    required this.values
  });

  factory Exchange.fromJson(Map<String, dynamic> json){
    return Exchange(
      id: json['id'].toString(),
      name: json['name'],
      values: Values.fromJSON(json['values']),
    );
  }
}