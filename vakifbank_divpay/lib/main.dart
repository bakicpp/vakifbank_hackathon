import 'package:flutter/material.dart';
import 'package:vakifbank_divpay/add_expense.dart';
import 'package:vakifbank_divpay/add_member_page.dart';
import 'package:vakifbank_divpay/create_card.dart';
import 'package:vakifbank_divpay/my_cards_page.dart';
import 'package:vakifbank_divpay/no_card_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyCardsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
