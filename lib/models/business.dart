import 'package:flutter/material.dart';

class Business {
  final String id;
  final String name;
  final String category;
  final Offset position;
  final double rating;
  final int reviewCount;
  String tagline;
  bool isAnalyzing;
  final List<String> offerings;

  Business({
    required this.id,
    required this.name,
    required this.category,
    required this.position,
    required this.rating,
    required this.reviewCount,
    required this.tagline,
    required this.isAnalyzing,
  }) : offerings = _generateOfferings(category);

  static List<String> _generateOfferings(String category) {
    final offerings = {
      'Food': ['Signature Dishes', 'Chef Specials', 'Fresh Ingredients', 'Outdoor Seating'],
      'Bar': ['Craft Cocktails', 'Happy Hour', 'Live Music', 'Premium Spirits'],
      'Night Clubs': ['DJ Sets', 'VIP Tables', 'Dance Floor', 'Bottle Service'],
      'Cafe': ['Specialty Coffee', 'Fresh Pastries', 'Free WiFi', 'Cozy Ambiance'],
      'Entertainment': ['Latest Shows', 'Premium Sound', 'Comfortable Seating', 'Snack Bar'],
    };
    return offerings[category] ?? ['Great Service', 'Friendly Staff', 'Clean Environment'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'rating': rating,
      'reviewCount': reviewCount,
      'tagline': tagline,
    };
  }

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      position: const Offset(0.5, 0.5),
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      tagline: json['tagline'] ?? '',
      isAnalyzing: false,
    );
  }
}
