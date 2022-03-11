import 'package:cointracker/features/exchange_detail/exchange_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class coinSwiper extends StatelessWidget {
  final Color color;
  const coinSwiper({Key? key, required this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _pageController = PageController(initialPage: 1, viewportFraction: 0.3);

    return SizedBox(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: 10,
        itemBuilder: (context, i)
        => _tarjeta(context, color),
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Color color) {
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
                    color: color,
                    width: 2
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                /*child: Image.network(
                    imageURL,
                    height: 100.0,
                    width: 100.0,
                    fit:BoxFit.fill
                ),

                 */
              )
          ),
          const Text(
            'Exemple',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, ExchangeDetailPage.routeID);
      },
    );
  }
}
