import 'package:flutter/material.dart';
import 'class_table.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          ClassTable(),
        ],
      ),
    );
  }
}
