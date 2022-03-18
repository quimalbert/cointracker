import 'package:cointracker/features/exchange_detail/exchange_detail_page.dart';
import 'package:cointracker/shared/domain/exchange.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:flutter/material.dart';

class ExchangeCard extends StatelessWidget {
  final Exchange exchange;
  const ExchangeCard({
    Key? key,
    required this.exchange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        ExchangeDetailPage.routeID,
        arguments: exchange,
      ),
      child: Card(
        child: Container(
            height: DEVICE_SCREEN_HEIGHT * 0.15,
            width: DEVICE_SCREEN_WIDTH * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                exchange.imageURL,
                height: DEVICE_SCREEN_HEIGHT * 0.15,
                width: DEVICE_SCREEN_WIDTH * 0.25,
                fit: BoxFit.fill,
              ),
            )),
      ),
    );
  }
}
