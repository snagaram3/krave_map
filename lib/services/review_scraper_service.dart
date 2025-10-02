Iimport 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/review.dart';

class ReviewScraperService {
  static const String baseUrl = 'https://your-api-url.com/api';
  
  /// Scrapes reviews from multiple sources for a business
  static Future<List<Review>> scrapeReviews(String businessId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/scrape-reviews/$businessId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => Review.fromJson(item)).toList();
      } else {
        throw Exception('Failed to scrape reviews: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error scraping reviews: $e');
    }
  }

  /// Triggers backend to scrape reviews from specified sources
  static Future<void> triggerScraping(
    String businessId, 
    List<String> sources,
  ) async {
    try {
      await http.post(
        Uri.parse('$baseUrl/trigger-scraping'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'businessId': businessId,
          'sources': sources, // ['google', 'yelp', 'tripadvisor']
        }),
      );
    } catch (e) {
      throw Exception('Error triggering scraping: $e');
    }
  }
}
