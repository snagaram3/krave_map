import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/review.dart';

class AITaglineGenerator {
  static const String baseUrl = 'https://your-api-url.com/api';

  /// Generates a tagline using AI based on reviews
  static Future<String> generateTagline(List<Review> reviews) async {
    try {
      // Aggregate review texts
      final reviewTexts = reviews.map((r) => r.text).toList();
      
      final response = await http.post(
        Uri.parse('$baseUrl/generate-tagline'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'reviews': reviewTexts,
          'reviewCount': reviews.length,
          'averageRating': _calculateAverageRating(reviews),
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['tagline'] as String;
      } else {
        throw Exception('Failed to generate tagline: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error generating tagline: $e');
    }
  }

  static double _calculateAverageRating(List<Review> reviews) {
    if (reviews.isEmpty) return 0.0;
    final sum = reviews.fold(0.0, (sum, review) => sum + review.rating);
    return sum / reviews.length;
  }

  /// Analyzes sentiment of reviews
  static Future<Map<String, dynamic>> analyzeSentiment(
    List<Review> reviews,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/analyze-sentiment'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'reviews': reviews.map((r) => r.text).toList(),
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to analyze sentiment');
      }
    } catch (e) {
      throw Exception('Error analyzing sentiment: $e');
    }
  }
}
