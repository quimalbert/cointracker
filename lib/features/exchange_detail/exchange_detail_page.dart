import 'package:cointracker/shared/domain/exchange.dart';
import 'package:cointracker/shared/ui/app_bar/general_bottom_app_bar.dart';
import 'package:cointracker/shared/ui/app_bar/general_top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExchangeDetailPage extends StatelessWidget {
  static const String routeID = '/exchange_detail';

  const ExchangeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Exchange _exchange =
        ModalRoute.of(context)!.settings.arguments as Exchange;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              alignment: Alignment.topCenter,
              child: Image.network(_exchange.imageURL,
                  height: 100.0, fit: BoxFit.contain),
            ),
            Text(
              _exchange.name,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              _exchange.yearEstablished.toString(),
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              //apply padding to all four sides
              child: Text('Country: ' + _exchange.country),
            ),
            ElevatedButton(
              child: const Text('URL'),
              onPressed: () => _launchURL(_exchange.url),
              style: const ButtonStyle(),
            ),
          ],
        ),
        appBar: const GeneralTopAppBar(),
        bottomNavigationBar: const GeneralBottomAppBar(),
      ),
    );
  }

  _launchURL(String url) {
    launch(url);
  }
}
