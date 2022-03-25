import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String id;
  String displayName;
  String photoUrl;
  String email;

  User({
    required this.id,
    required this.displayName,
    required this.photoUrl,
    required this.email,
  });

//factory User.fromFirestore(DocumentSnapshot userDoc) {
//  Map userData = userDoc.data;
//    return User(
//    id: userDoc.documentID,
//  displayName: userData['displayName'],
// photoUrl: userData['photoUrl'],
//email: userData['email'],
//);
//}
}
