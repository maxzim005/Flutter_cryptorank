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