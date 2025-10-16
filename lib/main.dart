// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:store_app/helper/Api.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/updatePage.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdatePage.id: (context) => UpdatePage(),
      },
    );
  }
}
