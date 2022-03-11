import 'package:flutter/cupertino.dart';

class Exchange{
  final String id;
  final String name;
  final int? year_established;
  final String? country;
  //final String description;
  final String? url;
  final String image;

  Exchange({
    required this.id,
    required this.name,
    required this.year_established,
    required this.country,
    //required this.description,
    required this.url,
    required this.image
  });
}