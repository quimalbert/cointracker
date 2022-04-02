import 'package:cointracker/features/coin_detail/ui/coin_detail_page.dart';
import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PortfolioCoinCard extends StatelessWidget {
  final Coin coin;
  final double quantity;
  final dynamic onDeleteButtonTapped;

  PortfolioCoinCard({
    Key? key,
    required this.quantity,
    required this.coin,
    required this.onDeleteButtonTapped,
  }) : super(key: key);

  final NumberFormat _formatCurrency = NumberFormat.compactSimpleCurrency();
  final NumberFormat _formatNumber = NumberFormat.compact();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        CoinDetailPage.routeID,
        arguments: coin,
      ),
      child: SizedBox(
        height: DEVICE_SCREEN_HEIGHT * 0.125,
        child: Card(
          elevation: 10,
          color: backgroundColor,
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
                  coin.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _formatNumber.format(quantity) + ' ' + coin.symbol,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _formatCurrency.format(quantity * coin.price),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        tooltip: 'Delete',
                        onPressed: onDeleteButtonTapped,
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        )),
                    IconButton(
                      tooltip: '${coin.symbol} Detail',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          CoinDetailPage.routeID,
                          arguments: coin,
                        );
                      },
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
      ),
    );
  }
}
