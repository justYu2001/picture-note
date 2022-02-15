import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:picture_note/locator.dart';
import 'package:picture_note/viewmodels/class_manage_model.dart';
import 'normal_class_table.dart';
import 'select_class_table.dart';
class ClassTableManage extends StatelessWidget {
  const ClassTableManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClassTableManageModel>(
      create: (context) => locator<ClassTableManageModel>(),
      child: Consumer<ClassTableManageModel>(
        builder: (context, classTableManageModel, child) {
          return classTableManageModel.getSelectMode == true
              ? SelectClassTable() : NormalClassTable();
        }
      )
    );
  }
}
