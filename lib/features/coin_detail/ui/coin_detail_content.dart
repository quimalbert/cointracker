import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/ui/styles.dart';
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
        SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.025),
        Image.network(
          'https://cryptoicons.org/api/color/${widget.coin.symbol.toLowerCase()}/200',
          height: DEVICE_SCREEN_HEIGHT * 0.25,
          width: DEVICE_SCREEN_WIDTH * 0.25,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Image.asset(
              'assets/images/no-image.png',
              height: DEVICE_SCREEN_HEIGHT * 0.25,
              width: DEVICE_SCREEN_WIDTH * 0.25,
            );
          },
        ),
        SizedBox(height: DEVICE_SCREEN_HEIGHT * 0.025),
        Text(
          widget.coin.name + ' (' + widget.coin.symbol + ')',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: DEVICE_SCREEN_HEIGHT * 0.05),
        ),
      ],
    );
  }
}
