class Review {
  final String id;
  final String businessId;
  final String author;
  final String text;
  final double rating;
  final DateTime date;
  final String source; // 'google', 'yelp', etc.

  Review({
    required this.id,
    required this.businessId,
    required this.author,
    required this.text,
    required this.rating,
    required this.date,
    required this.source,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      businessId: json['businessId'],
      author: json['author'],
      text: json['text'],
      rating: json['rating'].toDouble(),
      date: DateTime.parse(json['date']),
      source: json['source'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessId': businessId,
      'author': author,
      'text': text,
      'rating': rating,
      'date': date.toIso8601String(),
      'source': source,
    };
  }
}
