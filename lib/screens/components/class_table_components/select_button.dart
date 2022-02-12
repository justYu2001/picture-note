import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.select_all),
      color: Colors.white,
      onPressed: () {},
    );
  }
}