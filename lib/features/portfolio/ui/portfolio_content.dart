import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cointracker/shared/domain/database.dart';
import 'package:flutter/material.dart';

class PortfolioContent extends StatefulWidget {
  const PortfolioContent({Key? key}) : super(key: key);
  @override
  State<PortfolioContent> createState() => _PortfolioContentState();
}

class _PortfolioContentState extends State<PortfolioContent> {
  late DatabaseService dbs;
  String? _email, _password;
  late bool _isLoginCorrect;
  //final Stream<QuerySnapshot> portfolioData;

  var query = FirebaseFirestore.instance
      .collection('portfolio')
      .doc("arnaualaman@gmail.com")
      .get();
  var query2 = FirebaseFirestore.instance
      .collection('portfolio')
      .doc("arnaualaman@gmail.com")
      .collection("manolo")
      .get();
  void initState() {}

  @override
  Widget build(BuildContext context) {
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
                return Text(snapshot.data["description"]);
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
