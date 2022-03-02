class Crypto {
  final String id;
  final double price;
  final String title;
  final String imageUrl;
  final int rank;
  final int marketCap;
  final double percentChangein24hrs;

  Crypto(
      {required this.id,
      required this.price,
      required this.title,
      required this.imageUrl,
      required this.marketCap,
      required this.rank,
      required this.percentChangein24hrs});
}
