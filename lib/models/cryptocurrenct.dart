class CryptoCurrency {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? marketCap;
  double? marketCapRank;
  double? high24h;
  double? low24h;
  double? priceChange24h;
  double? priceChangePercentage24h;
  double? circulatingSupply;
  double? ath;
  double? atl;
  bool? isFavorites = false;

  CryptoCurrency({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.circulatingSupply,
    required this.ath,
    required this.atl,
  });

  factory CryptoCurrency.fromJson(Map<String, dynamic> map) {
    return CryptoCurrency(
      id: map['id'],
      symbol: map['symbol'],
      name: map['name'],
      image: map['image'],
      currentPrice: double.parse(map['current_price'].toString()),
      marketCap: double.parse(map['market_cap'].toString()),
      marketCapRank: double.parse(map['market_cap_rank'].toString()),
      high24h: double.parse(map['high_24h'].toString()),
      low24h: double.parse(map['low_24h'].toString()),
      priceChange24h: double.parse(map['price_change_24h'].toString()),
      priceChangePercentage24h:
          double.parse(map['price_change_percentage_24h'].toString()),
      circulatingSupply: double.parse(map['circulating_supply'].toString()),
      ath: double.parse(map['ath'].toString()),
      atl: double.parse(map['atl'].toString()),
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['symbol'] = this.symbol;
  //   data['name'] = this.name;
  //   data['image'] = this.image;
  //   data['current_price'] = this.currentPrice;
  //   data['market_cap'] = this.marketCap;
  //   data['market_cap_rank'] = this.marketCapRank;
  //   data['high_24h'] = this.high24h;
  //   data['low_24h'] = this.low24h;
  //   data['price_change_24h'] = this.priceChange24h;
  //   data['price_change_percentage_24h'] = this.priceChangePercentage24h;
  //   data['circulating_supply'] = this.circulatingSupply;
  //   data['total_supply'] = this.totalSupply;
  //   data['max_supply'] = this.maxSupply;
  //   data['ath'] = this.ath;
  //   data['ath_change_percentage'] = this.athChangePercentage;
  //   data['ath_date'] = this.athDate;
  //   data['atl'] = this.atl;
  //   data['atl_change_percentage'] = this.atlChangePercentage;
  //   data['atl_date'] = this.atlDate;
  //   data['last_updated'] = this.lastUpdated;
  //   return data;
  // }
}
