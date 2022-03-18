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
                padding: const EdgeInsets.all(5.0),
                margin: const EdgeInsets.only(bottom: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isWinner ? Colors.green : Colors.redAccent,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'https://cryptoicons.org/api/color/${coin.symbol.toLowerCase()}/200',
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.fill,
                  ),
                )),
            const Text(
              'Exemple',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
