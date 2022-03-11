import 'package:cointracker/shared/ui/app_bar/general_bottom_app_bar.dart';
import 'package:cointracker/shared/ui/app_bar/general_top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExchangeDetailPage extends StatelessWidget {
  static const String routeID = '/exhangedetail';

  const ExchangeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> exchangeInfo = ModalRoute
        .of(context)!
        .settings
        .arguments as List<String>;

    final String exchangeName = exchangeInfo.elementAt(0).toString();
    final String imageURL = exchangeInfo.elementAt(1).toString();
    String yearEstablished = exchangeInfo.elementAt(2).toString();
    final String country = exchangeInfo.elementAt(3).toString();
    final String url = exchangeInfo.elementAt(4).toString();

    if (yearEstablished == '0') {
      // UNKNOWN DATA ESTABLISHED
      yearEstablished = '';
    } else {
      yearEstablished = yearEstablished + ' - Actuality';
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              alignment: Alignment.topCenter,
              child: Image.network(
                  imageURL,
                  height: 100.0,
                  fit: BoxFit.contain
              ),
            ),
            Text(
              exchangeName,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              yearEstablished,
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              //apply padding to all four sides
              child: Text(
                  'Country: ' + country
              ),
            ),
            ElevatedButton(
                child: const Text('URL'),
                onPressed: ()=> _launchURL(url),
                style: const ButtonStyle(
                ),
            ),
          ],
        ),
        appBar: const GeneralTopAppBar(),
        bottomNavigationBar: const GeneralBottomAppBar(),
      ),
    );
  }

  _launchURL(String url){
    launch(url);
  }
}