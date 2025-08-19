// This is a basic Flutter widget test for the E-Commerce app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/main.dart';

void main() {
  testWidgets('E-Commerce app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ECommerceApp());

    // Verify that the app loads with the home screen
    expect(find.text('E-Commerce App'), findsOneWidget);
    
    // Wait for the app to settle
    await tester.pumpAndSettle();
  });
}
