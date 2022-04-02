import 'package:cointracker/features/coin_detail/ui/widgets/coin_detail_header.dart';
import 'package:cointracker/features/coin_detail/ui/widgets/coin_detail_stats.dart';
import 'package:cointracker/shared/domain/coin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinDetailContent extends StatefulWidget {
  final Coin coin;

  const CoinDetailContent({Key? key, required this.coin}) : super(key: key);
  @override
  State<CoinDetailContent> createState() => _CoinDetailContentState();
}

class _CoinDetailContentState extends State<CoinDetailContent> {
  final NumberFormat _numberFormat = NumberFormat.compact();

  @override
  Widget build(BuildContext context) {
    String winOrLose;
    if (widget.coin.priceChange24h > 0) {
      winOrLose = "up";
    } else {
      winOrLose = "down";
    }
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
        ),
        Padding(
          padding: EdgeInsets.only(right: 45, left: 45, top: 12),
          child: Title(
            color: Colors.black,
            child: Text(widget.coin.symbol.toUpperCase() + " live data",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 45, left: 45, top: 12),
          child: Text(
            widget.coin.name +
                " is the #" +
                widget.coin.marketRank.toString() +
                " top crypto currencies in the world. " +
                widget.coin.symbol.toUpperCase() +
                " to USD price in real-time. Bitcoin is " +
                winOrLose +
                " " +
                _numberFormat.format(widget.coin.priceChange24h) +
                "% in the last 24 hours." +
                "" +
                " In the last 24 hours it have been traded " +
                _numberFormat.format(widget.coin.volume24h) +
                " USD worth of " +
                widget.coin.name +
                ". It has a circulating supply of " +
                widget.coin.currentSupply.toString() +
                " " +
                widget.coin.symbol +
                " coins and a max supply of " +
                widget.coin.maxSupply.toString() +
                " " +
                widget.coin.symbol +
                " coins."
                    "",
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
