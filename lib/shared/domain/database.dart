import 'package:cloud_firestore/cloud_firestore.dart';

import '../application/read_user_data.dart';

class DatabaseService {
  final CollectionReference brewsCollection =
      FirebaseFirestore.instance.collection('portfolio');

  Future<void> setPortfolio(
    Map<String, dynamic> _coinMap,
  ) async {
    Map<String, dynamic> _userMap = {};
    _userMap = await ReadUserDataUseCase().call();
    String _email = _userMap['email'];

    await FirebaseFirestore.instance
        .collection('portfolio')
        .doc(_email)
        .set(_coinMap);
  }

  Future<Map<String, dynamic>> getUserPortfolio() async {
    Map<String, dynamic> _userMap = {};

    _userMap = await ReadUserDataUseCase().call();

    String _email = _userMap['email'];

    dynamic query = await FirebaseFirestore.instance
        .collection('portfolio')
        .doc(_email)
        .get();

    Map<String, dynamic> _portfolioMap = query.data();

    return _portfolioMap;
  }
}
