import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference brewsCollection =
      FirebaseFirestore.instance.collection('portfolio');

  Future<List<Map<String, dynamic>>> getUserPortfolio(String email) async {
    var query = await FirebaseFirestore.instance
        .collection('portfolio')
        .doc(email)
        .get();
    List<Map<String, dynamic?>> _portfolio = [
      /*{
        "symbol": "btc",
        "quantity": 1,
        "buyPrice": 42123.23,
        "buyDate": 1236217933,
      },
      {
        "symbol": "eth",
        "quantity": 1,
        "buyPrice": 3213.54,
        "buyDate": 1236217933,
      },*/
    ];
    query.data()?.values.forEach((element) {
      _portfolio.add(element);
    });
    return _portfolio;
  }
/*
  factory DatabaseService.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return DatabaseService(
      description: data['description'],
      /*
      coin_buy_date: data['coin']['buyDate'],
      coin_buy_price: data['coin']['buyPrice'],
      coin_Amount: data['coin']['coinAmount'],
      coin_Id: data['coin']['coinAmount'],
      createDate: data['createDate'],
      portfolio_name: data['name'],
      userEmail: data['userEmail'],*/
    );
    // calendarEvents: data['calendarEvents']);
  }
}
*/
}
