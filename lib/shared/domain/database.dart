import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  DatabaseService(
      {description,
      coin_buy_price,
      coin_buy_date,
      coin_Id,
      coin_Amount,
      userEmail,
      createDate,
      portfolio_name});
  final CollectionReference brewsCollection =
      FirebaseFirestore.instance.collection('portfolio');

  Future getUserPortfolio(String email) async {
    late Map<String, dynamic> prova;

    //FirebaseFirestore.instance.collection('portfolio').snapshots().map(query) => query.docs.map((doc) => doc.data()['test']);

    final _ref = FirebaseFirestore.instance
        .collection('portfolio')
        .snapshots()
        .map((query) => query.docs
            .map((doc) => doc
                .data()['portafolio']
                .map((testDoc) => DatabaseService.fromDoc(testDoc)))
            .toList());
    print("hola");
  }

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
