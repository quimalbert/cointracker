import 'package:cointracker/features/coin_detail/ui/coin_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class coinSwiper extends StatelessWidget {
  final List<String> coinList;
  final Color color;
  const coinSwiper({Key? key, required this.coinList, required this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _pageController = PageController(initialPage: 1, viewportFraction: 0.3);

    return SizedBox(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: coinList.length,
        itemBuilder: (context, i) => _tarjeta(context, coinList.elementAt(i), color),
      ),
    );
  }

  Widget _tarjeta(BuildContext context, String coinName, Color color) {
    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0, top: 20),
      child: Column(
        children: <Widget>[
          Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: color,
                  width: 2
                ),
              ),
              child: Text(
                coinName,
                textAlign: TextAlign.center,
              ),
            ),
          SizedBox(height: 5.0),
        ],
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, CoinDetailPage.routeID);
      },
    );
  }
}
