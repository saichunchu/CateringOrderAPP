import 'package:flutter/material.dart';
import 'screens/bulk_food_delivery_screen.dart';

void main() {
  runApp(CateringApp());
}

class CateringApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: WeddingScreen(),
    );
  }
}
