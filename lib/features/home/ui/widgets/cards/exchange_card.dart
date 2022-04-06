import 'package:cointracker/features/exchange_detail/exchange_detail_page.dart';
import 'package:cointracker/shared/domain/exchange.dart';
import 'package:cointracker/shared/utils/constants.dart';
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Card(
          color: backgroundColor,
          elevation: 4,
          shadowColor: Colors.black26,
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
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      exchange.imageURL,
                      fit: BoxFit.fitWidth,
                    ),
                  )),
              SizedBox(
                height: 30,
                child: Text(exchange.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.5)),
              ),
              const SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
