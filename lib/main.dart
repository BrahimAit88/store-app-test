import 'package:flutter/material.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/update_page.dart';

void main() {
  runApp(const StorApp());
}

class StorApp extends StatelessWidget {
  const StorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdatePage.id: (contest) => UpdatePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
