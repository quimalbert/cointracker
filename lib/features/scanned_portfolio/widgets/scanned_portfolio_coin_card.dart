import 'package:cointracker/shared/domain/coin.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:cointracker/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScannedPortfolioCoinCard extends StatelessWidget {
  final Coin coin;
  final double quantity;

  ScannedPortfolioCoinCard({
    Key? key,
    required this.quantity,
    required this.coin,
  }) : super(key: key);

  final NumberFormat _formatCurrency = NumberFormat.compactSimpleCurrency();
  final NumberFormat _formatNumber = NumberFormat.compact();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        ),
      ),
    );
  }
}
