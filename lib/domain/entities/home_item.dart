class HomeItem {
  HomeItem({
    required this.id,
    required this.isLiked,
    required this.image,
    required this.title,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.badge1,
    required this.badge2,
    required this.amount,
  });

  final double amount;
  final String badge1;
  final String badge2;
  final String id;
  final String? image;
  final bool isLiked;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String title;

  HomeItem copyWith({
    String? id,
    double? amount,
    String? badge1,
    String? badge2,
    String? image,
    bool? isLiked,
    String? text1,
    String? text2,
    String? text3,
    String? text4,
    String? title,
  }) {
    return HomeItem(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      badge1: badge1 ?? this.badge1,
      badge2: badge2 ?? this.badge2,
      image: image ?? this.image,
      isLiked: isLiked ?? this.isLiked,
      text1: text1 ?? this.text1,
      text2: text2 ?? this.text2,
      text3: text3 ?? this.text3,
      text4: text4 ?? this.text4,
      title: title ?? this.title,
    );
  }
}
