import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picture_note/screens/camera.dart';
import 'class_table.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(
      initialPage: 1,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(

        controller: pageController,
        physics: const ClampingScrollPhysics(),
        children: [
          Camera(pageController),
          const ClassTable(),
        ],
        onPageChanged: (pageIndex) {
          if(pageIndex == 0) {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: [],
            );
          } else {
            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: SystemUiOverlay.values,
            );
          }
        },
      ),
    );
  }
}
