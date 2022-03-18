class Exchange {
  final String id;
  final String name;
  final int yearEstablished;
  final String country;
  final String description;
  final String url;
  final String imageURL;

  Exchange(
      {required this.id,
      required this.name,
      required this.yearEstablished,
      required this.country,
      required this.description,
      required this.url,
      required this.imageURL});
}
