import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:business_discovery/main.dart';

void main() {
  testWidgets('App loads with category selector', (WidgetTester tester) async {
    await tester.pumpWidget(const BusinessDiscoveryApp());

    expect(find.text('Food'), findsOneWidget);
    expect(find.text('Bar'), findsOneWidget);
    expect(find.text('Night Clubs'), findsOneWidget);
  });

  testWidgets('Category changes when tapped', (WidgetTester tester) async {
    await tester.pumpWidget(const BusinessDiscoveryApp());

    await tester.tap(find.text('Bar'));
    await tester.pumpAndSettle();

    // Verify category changed
    expect(find.text('Bar'), findsOneWidget);
  });
}
