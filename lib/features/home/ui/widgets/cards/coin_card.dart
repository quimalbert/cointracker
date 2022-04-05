import 'package:cointracker/features/coin_detail/ui/coin_detail_page.dart';
import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final Coin coin;
  final bool isWinner;

  const CoinCard({
    Key? key,
    required this.isWinner,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, CoinDetailPage.routeID, arguments: coin),
      child: Card(
        elevation: 20,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
                height: DEVICE_SCREEN_HEIGHT * 0.125,
                width: DEVICE_SCREEN_WIDTH * 0.125,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isWinner ? Colors.green : Colors.redAccent,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/coin_logos/${coin.symbol}.png',
                    height: DEVICE_SCREEN_HEIGHT * 0.2,
                    width: DEVICE_SCREEN_WIDTH * 0.2,
                    fit: BoxFit.fill,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      // If error builder draws i want the container below colour to become transparent...
                      // how  do i do this?
                      return Image.asset('assets/images/no-image.png');
                    },
                  ),
                )),
            Text(coin.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text('\$${coin.price.toStringAsFixed(3)}',
                textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
