import 'package:cointracker/features/home/ui/widgets/cards/coin_card.dart';
import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoinSwiper extends StatelessWidget {
  final bool isWinner;
  final List<Coin> coinList;

  const CoinSwiper({Key? key, required this.isWinner, required this.coinList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: DEVICE_SCREEN_HEIGHT * 0.215,
        child: PageView.builder(
          pageSnapping: false,
          physics: const BouncingScrollPhysics(),
          controller: PageController(initialPage: 1, viewportFraction: 0.3),
          itemCount: coinList.length,
          itemBuilder: (context, index) => CoinCard(
            isWinner: isWinner,
            coin: coinList.elementAt(index),
          ),
        ),
      ),
    );
  }
}
