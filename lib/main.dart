import 'package:flutter/material.dart';
import 'package:handling_json_data/models.dart/news_data.dart';
import 'package:handling_json_data/pages/stories.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (context) => NewsData(),
          builder: (context, child) {
            return StoriesPage();
          }),
    );
  }
}
