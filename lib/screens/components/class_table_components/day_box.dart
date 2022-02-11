import 'package:flutter/material.dart';

class DayBox extends StatelessWidget {
  final String day;

  const DayBox({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        color: const Color.fromRGBO(98, 108, 126, 0.5),
        child: SizedBox(
          width: 45,
          height: 30,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              day,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}