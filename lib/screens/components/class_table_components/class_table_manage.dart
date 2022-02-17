import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:picture_note/locator.dart';
import 'package:picture_note/viewmodels/class_manage_model.dart';
import 'normal_class_table.dart';
import 'select_class_table.dart';

class ClassTableManage extends StatefulWidget {
  const ClassTableManage({Key? key}) : super(key: key);

  @override
  _ClassTableManageState createState() => _ClassTableManageState();
}

class _ClassTableManageState extends State<ClassTableManage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClassTableManageModel>.value(
        value: locator<ClassTableManageModel>(),
        child: Consumer<ClassTableManageModel>(
            builder: (context, classTableManageModel, child) =>
            classTableManageModel.selectMode == true ? SelectClassTable() : NormalClassTable()
        )
    );
  }
}

