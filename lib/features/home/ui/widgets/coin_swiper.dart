import 'package:cointracker/features/exchange_detail/ui/exchange_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/domain/coin.dart';
import '../../../../shared/ui/styles.dart';

class coinSwiper extends StatelessWidget {
  final Color color;
  List<Coin> coinList = [];

  coinSwiper({
    Key? key,
    required this.color,
    required this.coinList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _pageController =
        PageController(initialPage: 1, viewportFraction: 0.3);

    return SizedBox(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: coinList.length,
        itemBuilder: (context, i) =>
            _card(context, color, coinList.elementAt(i)),
      ),
    );
  }

  Widget _card(BuildContext context, Color color, Coin coin) {
    final card = Container(
      margin: const EdgeInsets.only(right: 15.0, top: 20),
      child: Column(
        children: <Widget>[
          Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.only(bottom: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: color, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  'https://cryptoicons.org/api/color/${coin.symbol.toLowerCase()}/200',
                  height: DEVICE_SCREEN_HEIGHT * 0.25,
                  width: DEVICE_SCREEN_WIDTH * 0.25,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      'assets/images/no-image.png',
                      height: DEVICE_SCREEN_HEIGHT * 0.25,
                      width: DEVICE_SCREEN_WIDTH * 0.25,
                    );
                  },
                ),
              )),
          Text(
            coin.name,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );

    return GestureDetector(
      child: card,
      onTap: () {
        Navigator.pushNamed(context, ExchangeDetailPage.routeID);
      },
    );
  }
}
