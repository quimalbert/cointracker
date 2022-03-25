import 'package:cointracker/features/coin_detail/ui/coin_detail_page.dart';
import 'package:cointracker/shared/domain/coin.dart';
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
        elevation: 10,
        child: Column(
          children: [
            Container(
                height: 100,
                width: 100,
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
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.fill,
                  ),
                )),
            Text(
              coin.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold)
            ),
            Padding(
                padding:  const EdgeInsets.only(top: 5),
                child: Text(
                    '\$${coin.price.toStringAsFixed(3)}'
                ),
            ),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
