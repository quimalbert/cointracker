class Coin {
  final int id;
  final String name;
  final String symbol;
  final int? maxSupply;
  final double currentSupply;
  final String? protocolType;
  final int marketRank;
  final double marketCap;
  final double marketCapDominance;
  final double fullyDilutedMarketCap;
  final double volume24h;
  final double volumeChange24h;
  final double price;
  final double priceChange1h;
  final double priceChange24h;
  final double priceChange7d;
  final double priceChange30d;
  final double priceChange60d;
  final double priceChange90d;

  Coin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.maxSupply,
    required this.currentSupply,
    required this.protocolType,
    required this.marketRank,
    required this.marketCap,
    required this.marketCapDominance,
    required this.fullyDilutedMarketCap,
    required this.volume24h,
    required this.volumeChange24h,
    required this.price,
    required this.priceChange1h,
    required this.priceChange7d,
    required this.priceChange24h,
    required this.priceChange30d,
    required this.priceChange60d,
    required this.priceChange90d,
  });
}
