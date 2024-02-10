class HomeItem {
  HomeItem(
      {required this.isLiked,
      required this.image,
      required this.title,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.badge1,
      required this.badge2,
      required this.amount});

  final double amount;
  final String badge1;
  final String badge2;
  final String? image;
  final bool isLiked;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String title;
}
