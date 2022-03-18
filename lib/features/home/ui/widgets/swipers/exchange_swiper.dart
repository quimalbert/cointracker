import 'package:cointracker/features/home/ui/widgets/cards/exchange_card.dart';
import 'package:cointracker/shared/domain/exchange.dart';
import 'package:cointracker/shared/ui/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExchangeSwiper extends StatelessWidget {
  final List<Exchange> exchangeList;
  const ExchangeSwiper({Key? key, required this.exchangeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageController =
        PageController(initialPage: 1, viewportFraction: 0.3);

    return Padding(
      padding: const EdgeInsets.only(right: 0.0, left: 0.0),
      child: SizedBox(
        height: DEVICE_SCREEN_HEIGHT * 0.3,
        child: PageView.builder(
            pageSnapping: false,
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: exchangeList.length,
            itemBuilder: (context, index) => Column(
                  children: [
                    ExchangeCard(exchange: exchangeList.elementAt(index)),
                    Text(
                      exchangeList.elementAt(index).name,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
      ),
    );
  }
}
