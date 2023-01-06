class Price {
  final dynamic timestamp;
  final dynamic value;

  Price({required this.timestamp, required this.value});
  factory Price.fromJson(List<dynamic> json) {
    return Price(
      timestamp: json[0] as int,
      value: json[1] as double,
    );
  }
}
