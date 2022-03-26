import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cointracker/shared/domain/database.dart';
import 'package:flutter/material.dart';

class PortfolioContent extends StatefulWidget {
  const PortfolioContent({Key? key}) : super(key: key);
  @override
  State<PortfolioContent> createState() => _PortfolioContentState();
}

class _PortfolioContentState extends State<PortfolioContent> {
  _PortfolioContentState();
  late DatabaseService dbs;
  String? _email, _password;
  late bool _isLoginCorrect;
  String email = "joanangel@gmail.com";

  //dbs.getUserPortfolio('email');
  //final Stream<QuerySnapshot> portfolioData;
  var query = FirebaseFirestore.instance
      .collection('portfolio')
      .doc("arnaualaman@gmail.com")
      .get();

  /*
  var query2 = FirebaseFirestore.instance
      .collection('portfolio')
      .doc("arnaualaman@gmail.com")
      .collection("manolo")
      .get();
   */

  void initState() {}

  @override
  Future<Widget> build(BuildContext context) async {
    DatabaseService dbs = new DatabaseService();
    List<Map<String, dynamic>> _portfolio =
        await dbs.getUserPortfolio("joanangel@gmail.com");
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        FutureBuilder(
          future: query,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Text("");
              }
            }
            return Text("");
          },
        ), /*
        StreamBuilder<QuerySnapshot>(
          stream: portfolioData,
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.hasError) {
              print("error");
              return Text("error");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("loading");
            }
            final data = snapshot.requireData;
            String prova = data.["arnaualaman@gmail.com"]["a"];
            return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  return Text("Hello");
                });
          },
        )
      */
      ],
    );
  }
}
