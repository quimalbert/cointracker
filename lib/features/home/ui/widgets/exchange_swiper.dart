import 'package:cointracker/features/exchange_detail/exchange_detail_page.dart';
import 'package:cointracker/features/home/domain/exchange.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class exchangeSwiper extends StatelessWidget {
  final List<Exchange> exchangeList;
  const exchangeSwiper({Key? key, required this.exchangeList}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _pageController = PageController(initialPage: 1, viewportFraction: 0.3);

    return SizedBox(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: exchangeList.length,
        itemBuilder: (context, i)
          => _tarjeta(context,
            exchangeList.elementAt(i).name,
            exchangeList.elementAt(i).image,
            exchangeList.elementAt(i).year_established,
            exchangeList.elementAt(i).country,
            exchangeList.elementAt(i).url),
      ),
    );
  }

  Widget _tarjeta(BuildContext context, String exchangeName, String imageURL, int? yearEstablished, String? country, String? url) {
    final tarjeta = Container(
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
                border: Border.all(
                  color: Colors.black,
                  width: 2
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageURL,
                  height: 100.0,
                  width: 100.0,
                  fit:BoxFit.fill
                ),
              )
            ),
            Text(
              exchangeName,
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 5.0),
        ],
      ),
    );

    yearEstablished ??= 0;
    country ??= 'Unknown';
    url ??= 'NO';
    final List<String> exchangeInfo = [exchangeName, imageURL, yearEstablished.toString(), country.toString(), url.toString()];

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, ExchangeDetailPage.routeID, arguments: exchangeInfo);
      },
    );
  }
}
