import 'package:flutter/material.dart';

class ClockBox extends StatelessWidget {
  final int colorSelect;
  final int clock;

  ClockBox({Key? key, required this.clock, required this.colorSelect})
      : super(key: key);

  Color odd = const Color.fromRGBO(92, 109, 155, 0.5);
  Color even = const Color.fromRGBO(102, 127, 180, 0.5);

  @override
  Widget build(BuildContext context) {
    Color boxColor = colorSelect % 2 == 1 ? odd : even;
    return Container(
      color: boxColor,
      child: SizedBox(
        width: 35,
        height: 70,
        child: Padding(
          padding: EdgeInsets.all(9),
          child: Text(
            clock.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}