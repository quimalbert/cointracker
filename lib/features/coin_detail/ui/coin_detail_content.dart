import 'package:cointracker/features/coin_detail/ui/widgets/coin_detail_header.dart';
import 'package:cointracker/features/coin_detail/ui/widgets/coin_detail_stats.dart';
import 'package:cointracker/shared/domain/coin.dart';
import 'package:flutter/material.dart';

class CoinDetailContent extends StatefulWidget {
  final Coin coin;

  const CoinDetailContent({Key? key, required this.coin}) : super(key: key);

  @override
  State<CoinDetailContent> createState() => _CoinDetailContentState();
}

class _CoinDetailContentState extends State<CoinDetailContent> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        CoinDetailHeader(
          coinSymbol: widget.coin.symbol.toUpperCase(),
          coinName: widget.coin.name,
          coinPrice: widget.coin.price.toStringAsFixed(2),
          percentageChange24h: widget.coin.priceChange24h,
        ),
        CoinDetailStats(
          marketRank: widget.coin.marketRank,
          marketCap: widget.coin.marketCap,
          fullyDilutedMarketCap: widget.coin.fullyDilutedMarketCap,
          maxSupply: widget.coin.maxSupply,
          currentSupply: widget.coin.currentSupply,
          symbol: widget.coin.symbol,
          marketCapDominance: widget.coin.marketCapDominance,
          protocolType: widget.coin.protocolType,
          volume24h: widget.coin.volume24h,
        )
      ],
    );
  }
}
