import 'package:flutter/material.dart';
import 'package:picture_note/screens/camera.dart';
import 'class_table.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: pageController,
        children: const [
          Camera(),
          ClassTable(),
        ],
      ),
    );
  }
}
