import 'package:flutter/material.dart';
import 'package:picture_note/locator.dart';
import 'package:picture_note/viewmodels/class_manage_model.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.select_all),
      color: Colors.white,
      onPressed: () {
        var classTableManageModel = locator<ClassTableManageModel>();
        classTableManageModel.setSelectMode = true;
      },
    );
  }
}