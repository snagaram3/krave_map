import 'package:flutter/material.dart';
import 'screens/category_map_screen.dart';

void main() {
  runApp(const BusinessDiscoveryApp());
}

class BusinessDiscoveryApp extends StatelessWidget {
  const BusinessDiscoveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Discovery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const CategoryMapScreen(),
    );
  }
}
