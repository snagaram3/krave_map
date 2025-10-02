import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import '../models/business.dart';
import '../widgets/category_selector.dart';
import '../widgets/business_marker.dart';
import 'business_detail_sheet.dart';

class CategoryMapScreen extends StatefulWidget {
  const CategoryMapScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMapScreen> createState() => _CategoryMapScreenState();
}

class _CategoryMapScreenState extends State<CategoryMapScreen>
    with TickerProviderStateMixin {
  String selectedCategory = 'Food';
  final List<String> categories = [
    'Food',
    'Bar',
    'Night Clubs',
    'Cafe',
    'Entertainment'
  ];

  final Map<String, Color> categoryColors = {
    'Food': Colors.orange,
    'Bar': Colors.purple,
    'Night Clubs': Colors.pink,
    'Cafe': Colors.brown,
    'Entertainment': Colors.teal,
  };

  late List<AnimationController> sparkleControllers;
  List<Business> businesses = [];

  @override
  void initState() {
    super.initState();
    _generateBusinesses();
    _initializeSparkleAnimations();
  }

  void _generateBusinesses() {
    final random = Random();
    businesses = List.generate(15, (index) {
      return Business(
        id: 'B${index + 1}',
        name: _generateBusinessName(selectedCategory, index),
        category: selectedCategory,
        position: Offset(
          random.nextDouble() * 0.8 + 0.1,
          random.nextDouble() * 0.7 + 0.15,
        ),
        rating: (random.nextDouble() * 2 + 3).toDouble(),
        reviewCount: random.nextInt(500) + 50,
        tagline: '',
        isAnalyzing: true,
      );
    });

    // Simulate AI tagline generation
    for (var business in businesses) {
      Future.delayed(Duration(seconds: random.nextInt(3) + 2), () {
        if (mounted) {
          setState(() {
            business.tagline = _generateTagline(business.name);
            business.isAnalyzing = false;
          });
        }
      });
    }
  }

  String _generateBusinessName(String category, int index) {
    final names = {
      'Food': ['Spice Heaven', 'Urban Bistro', 'Dragon Wok', 'Bella Italia', 'Taco Paradise'],
      'Bar': ['Midnight Lounge', 'The Copper Still', 'Velvet Room', 'Skyline Bar', 'Whiskey Den'],
      'Night Clubs': ['Neon Nights', 'Pulse Club', 'Electric Dreams', 'The Vault', 'Rhythm Box'],
      'Cafe': ['Bean & Brew', 'Morning Glory', 'Artisan Coffee', 'The Daily Grind', 'Cozy Corner'],
      'Entertainment': ['Star Cinema', 'Game Zone', 'The Playhouse', 'Virtual Reality Hub', 'Arcade Nation'],
    };
    final list = names[category]!;
    return list[index % list.length];
  }

  String _generateTagline(String businessName) {
    final taglines = [
      'Where every bite tells a story',
      'Unforgettable flavors, unbeatable vibes',
      'Your new favorite spot',
      'Excellence in every detail',
      'Where memories are made',
      'Taste the difference',
      'Experience redefined',
      'Simply extraordinary',
      'Passion meets perfection',
      'Your happy place awaits',
    ];
    return taglines[Random().nextInt(taglines.length)];
  }

  void _initializeSparkleAnimations() {
    sparkleControllers = List.generate(15, (index) {
      final controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1500 + Random().nextInt(1000)),
      )..repeat(reverse: true);
      return controller;
    });
  }

  @override
  void dispose() {
    for (var controller in sparkleControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _changeCategory(String category) {
    setState(() {
      selectedCategory = category;
      _generateBusinesses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              categoryColors[selectedCategory]!.withOpacity(0.2),
              Colors.black,
              categoryColors[selectedCategory]!.withOpacity(0.3),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              CategorySelector(
                categories: categories,
                selectedCategory: selectedCategory,
                categoryColors: categoryColors,
                onCategorySelected: _changeCategory,
              ),
              Expanded(child: _buildBusinessMap()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBusinessMap() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            // Background stars
            ...List.generate(30, (index) {
              final random = Random(index);
              return Positioned(
                left: random.nextDouble() * constraints.maxWidth,
                top: random.nextDouble() * constraints.maxHeight,
                child: Icon(
                  Icons.star,
                  color: Colors.white.withOpacity(0.1),
                  size: random.nextDouble() * 4 + 2,
                ),
              );
            }),
            // Business markers
            ...businesses.asMap().entries.map((entry) {
              final index = entry.key;
              final business = entry.value;
              return Positioned(
                left: business.position.dx * constraints.maxWidth,
                top: business.position.dy * constraints.maxHeight,
                child: BusinessMarker(
                  controller: sparkleControllers[index],
                  color: categoryColors[selectedCategory]!,
                  onLongPress: () => _showBusinessDetail(business),
                ),
              );
            }).toList(),
          ],
        );
      },
    );
  }

  void _showBusinessDetail(Business business) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BusinessDetailSheet(
        business: business,
        categoryColor: categoryColors[selectedCategory]!,
      ),
    );
  }
}
