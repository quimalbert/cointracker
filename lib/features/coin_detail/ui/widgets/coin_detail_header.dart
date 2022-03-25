import 'package:flutter/material.dart';

import '../../../../shared/ui/styles.dart';

class CoinDetailHeader extends StatelessWidget {
  final String coinSymbol;
  final String coinName;
  final String coinPrice;
  final double percentageChange24h;

  const CoinDetailHeader({
    Key? key,
    required this.coinSymbol,
    required this.coinName,
    required this.coinPrice,
    required this.percentageChange24h,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/coin_logos/$coinSymbol.png',
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset('assets/images/no-image.png');
              },
              height: DEVICE_SCREEN_HEIGHT * 0.25,
              width: DEVICE_SCREEN_WIDTH * 0.25,
            ),
            SizedBox(width: DEVICE_SCREEN_WIDTH * 0.075),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coinName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: DEVICE_SCREEN_HEIGHT * 0.05),
                ),
                Row(
                  children: [
                    Text(
                      '\$' + coinPrice,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: DEVICE_SCREEN_WIDTH * 0.01),
                    Text(
                      percentageChange24h > 0
                          ? '+' + percentageChange24h.toStringAsFixed(2) + '%'
                          : '' + percentageChange24h.toStringAsFixed(2) + '%',
                      style: TextStyle(
                        color: percentageChange24h > 0
                            ? Colors.green
                            : Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
