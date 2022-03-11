import 'package:cointracker/features/coin_detail/ui/coin_detail_page.dart';
import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:flutter/material.dart';

class CoinListCard extends StatelessWidget {
  final String leadingText;
  final String trailingText;

  final Coin coin;

  const CoinListCard({
    Key? key,
    required this.leadingText,
    required this.trailingText,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DEVICE_SCREEN_HEIGHT * 0.1,
      child: Card(
        elevation: 10,
        color: Colors.redAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: EdgeInsets.only(
            right: DEVICE_SCREEN_WIDTH * 0.05,
            left: DEVICE_SCREEN_WIDTH * 0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                leadingText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    trailingText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    tooltip: '${coin.symbol} Detail',
                    onPressed: () => Navigator.pushNamed(
                        context, CoinDetailPage.routeID,
                        arguments: coin),
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
