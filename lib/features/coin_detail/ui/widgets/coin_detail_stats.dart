import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/ui/styles.dart';
import 'coin_detail_individual_stat.dart';

class CoinDetailStats extends StatelessWidget {
  final int marketRank;
  final double marketCap;
  final double fullyDilutedMarketCap;
  final int? maxSupply;
  final double currentSupply;
  final String symbol;
  final double marketCapDominance;
  final String? protocolType;
  final double volume24h;

  CoinDetailStats({
    Key? key,
    required this.marketRank,
    required this.marketCap,
    required this.fullyDilutedMarketCap,
    required this.maxSupply,
    required this.currentSupply,
    required this.symbol,
    required this.marketCapDominance,
    required this.protocolType,
    required this.volume24h,
  }) : super(key: key);

  final NumberFormat _formatCurrency = NumberFormat.compactSimpleCurrency();
  final NumberFormat _numberFormat = NumberFormat.compact();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoinDetailIndividualStat(
              title: 'Rank',
              text: '#$marketRank',
            ),
            SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.025),
            CoinDetailIndividualStat(
              title: 'Market Cap',
              text: _formatCurrency.format(marketCap),
            ),
            SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.025),
            CoinDetailIndividualStat(
              title: 'Fully diluted Market cap',
              text: _formatCurrency.format(fullyDilutedMarketCap),
            ),
            SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.025),
            CoinDetailIndividualStat(
              title: 'Max supply',
              text: maxSupply != null
                  ? _numberFormat.format(maxSupply) + ' ' + symbol
                  : '-',
            ),
            SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.025),
            CoinDetailIndividualStat(
              title: 'Current supply',
              text: _numberFormat.format(currentSupply) + ' ' + symbol,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoinDetailIndividualStat(
              title: 'Market dominance',
              text: marketCapDominance.toStringAsFixed(2) + '%',
            ),
            SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.025),
            CoinDetailIndividualStat(
              title: 'Protocol type',
              text: protocolType ?? '-',
            ),
            SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.025),
            CoinDetailIndividualStat(
              title: 'Volume 24h',
              text: _formatCurrency.format(volume24h),
            ),
          ],
        ),
      ],
    );
  }
}
