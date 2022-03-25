import 'package:cointracker/features/exchange_detail/exchange_detail_page.dart';
import 'package:cointracker/shared/domain/exchange.dart';
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
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    exchange.imageURL,
                    fit: BoxFit.fill,
                  ),
                )),
              Container(
                height: 35,
                child: Text(
                    exchange.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold)
                ),
              ),
              const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
